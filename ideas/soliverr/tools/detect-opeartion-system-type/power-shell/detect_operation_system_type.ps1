<#
.SYNOPSIS
    Detects the operating system type, version, and architecture.
    Based on the strategy defined in SKILL.md.

.PARAMETER Format
    Output format: text (default), json, yaml

.EXAMPLE
    .\detect_operation_system_type.ps1 json
#>

param (
    [Parameter(Position = 0)]
    [ValidateSet("text", "json", "yaml")]
    [string]$Format = "text",

    [Alias("h")]
    [switch]$Help
)

# --- Help Message ---
if ($Help) {
    Write-Host "Usage: .\detect_operation_system_type.ps1 [format]"
    Write-Host ""
    Write-Host "Detects the operating system type, version, and architecture."
    Write-Host ""
    Write-Host "Arguments:"
    Write-Host "  format    Output format: text (default), json, yaml"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -Help, -h  Show this help message"
    exit 0
}

$DistributorId = ""
$Description = ""
$Release = ""
$Codename = ""
$Kernel = ""
$Architecture = ""
$OSName = ""

if ($IsWindows) {
    $os = Get-CimInstance Win32_OperatingSystem
    $DistributorId = "Windows"
    $OSName = "Windows"
    $Release = $os.Version
    $Description = $os.Caption
    $Architecture = $os.OSArchitecture
    
    # Map build numbers (simplified)
    switch -Regex ($Release) {
        "^10\.0\.226" { $Codename = "Windows 11" }
        "^10\.0\.190" { $Codename = "Windows 10" }
        default { $Codename = "" }
    }
}
elseif ($IsLinux -or $IsMacOS) {
    # Try uname and fallback files
    $DistributorId = (uname -s)
    $Kernel = (uname -r)
    $Architecture = (uname -m)
    
    if ($IsMacOS) {
        $DistributorId = "macOS"
        $Release = (sw_vers -productVersion)
        $OSName = "macOS"
        
        # Map macOS codenames
        switch -Regex ($Release) {
            "^15\." { $Codename = "Sequoia" }
            "^14\." { $Codename = "Sonoma" }
            "^13\." { $Codename = "Ventura" }
            "^12\." { $Codename = "Monterey" }
            "^11\." { $Codename = "Big Sur" }
            "^10\.15" { $Codename = "Catalina" }
            "^10\.14" { $Codename = "Mojave" }
            "^10\.13" { $Codename = "High Sierra" }
        }
        $Description = "macOS $Codename ($Release)"
    }
    else {
        # Linux detection logic
        if (Get-Command lsb_release -ErrorAction SilentlyContinue) {
            $DistributorId = (lsb_release -is)
            $Release = (lsb_release -rs)
            $Description = (lsb_release -ds)
            $Codename = (lsb_release -cs)
        }
        elseif (Test-Path /etc/os-release) {
            $osRelease = Get-Content /etc/os-release | ConvertFrom-StringData
            $DistributorId = $osRelease.NAME -replace '"', ''
            $Release = $osRelease.VERSION_ID -replace '"', ''
            $Description = $osRelease.PRETTY_NAME -replace '"', ''
        }
        
        # WSL Check
        if ($Kernel -like "*microsoft*") {
            $Description += " (Running under WSL)"
        }
        $OSName = $DistributorId
    }
}
else {
    $OSName = "Unknown"
    $DistributorId = "Unknown"
    $Description = "Unknown OS Family"
}

# --- Format the Output ---
switch ($Format) {
    "json" {
        $output = @{
            os             = $OSName
            distributor_id = $DistributorId
            description    = $Description
            release        = $Release
            codename       = $Codename
            kernel         = $Kernel
            architecture   = $Architecture
        }
        $output | ConvertTo-Json
    }
    "yaml" {
        # Simple YAML formatting
        Write-Host "os: $OSName"
        Write-Host "distributor_id: $DistributorId"
        Write-Host "description: $Description"
        Write-Host "release: `"$Release`""
        Write-Host "codename: $Codename"
        Write-Host "kernel: $Kernel"
        Write-Host "architecture: $Architecture"
    }
    "text" {
        Write-Host "Distributor ID: $DistributorId"
        Write-Host "Description:    $Description"
        Write-Host "Release:        $Release"
        Write-Host "Codename:       $Codename"
        Write-Host "Kernel:         $Kernel"
        Write-Host "Architecture:   $Architecture"
    }
}
