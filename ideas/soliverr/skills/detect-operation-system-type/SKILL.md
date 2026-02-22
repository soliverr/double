---
name: detect-operation-system-type
description: >
  Detects the operating system type and specific version on the user's machine.
  Use this skill whenever the user asks about their OS, operating system version,
  system information, platform details, or wants to know what OS they're running.
  Also trigger when a task requires knowing the OS first (e.g., installation instructions,
  system compatibility checks, shell scripting). Works for all major OSes:
  Windows, macOS, Linux (all distros), FreeBSD, and other Unix-like systems.
---

# OS Detection Skill

Detect the operating system type and specific version. Works cross-platform for all major operating systems.

## Strategy

Always try multiple methods and cross-validate. Report the most specific version info available.

---

## Step 1: Detect OS Family

Run the following bash command to determine the OS family:

```bash
uname -s 2>/dev/null || echo "uname_unavailable"
```

| Output        | OS Family     |
|---------------|---------------|
| `Linux`       | Linux         |
| `Darwin`      | macOS         |
| `MINGW*` / `MSYS*` / `CYGWIN*` | Windows (via Git Bash/WSL boundary) |
| `FreeBSD`     | FreeBSD       |
| `OpenBSD`     | OpenBSD       |
| `NetBSD`      | NetBSD        |
| `SunOS`       | Solaris/illumos |
| `uname_unavailable` | Likely native Windows CMD — proceed to Windows detection |

---

## Step 2: Version Detection by OS

### 🐧 Linux

```bash
# Best: reads distro name + version
cat /etc/os-release 2>/dev/null

# Fallback options (try in order if above is missing)
cat /etc/lsb-release 2>/dev/null
cat /etc/redhat-release 2>/dev/null
cat /etc/debian_version 2>/dev/null
cat /etc/alpine-release 2>/dev/null
cat /etc/arch-release 2>/dev/null

# Kernel version (always available on Linux)
uname -r
```

**Parse from `/etc/os-release`:**
- `NAME` → distro name (e.g., Ubuntu, Fedora, Debian)
- `VERSION_ID` → version number
- `PRETTY_NAME` → human-readable full string (preferred for display)

**Common distros and their primary file:**
| Distro         | Primary File             |
|----------------|--------------------------|
| Ubuntu/Mint    | `/etc/os-release`        |
| Debian         | `/etc/os-release` + `/etc/debian_version` |
| RHEL/CentOS/Fedora | `/etc/os-release` + `/etc/redhat-release` |
| Arch Linux     | `/etc/os-release`        |
| Alpine         | `/etc/alpine-release`    |
| Gentoo         | `/etc/gentoo-release`    |
| openSUSE       | `/etc/os-release`        |

---

### 🍎 macOS

```bash
# Product name + version (e.g., "macOS 14.4.1")
sw_vers

# Also useful
uname -r          # Darwin kernel version
uname -m          # Architecture: x86_64 or arm64
```

**`sw_vers` output fields:**
- `ProductName` → macOS
- `ProductVersion` → e.g., `14.4.1`
- `BuildVersion` → e.g., `23E224`

**macOS version name mapping** (include in output):
| Version | Name        |
|---------|-------------|
| 15.x    | Sequoia     |
| 14.x    | Sonoma      |
| 13.x    | Ventura     |
| 12.x    | Monterey    |
| 11.x    | Big Sur     |
| 10.15   | Catalina    |
| 10.14   | Mojave      |
| 10.13   | High Sierra |

---

### 🪟 Windows

```bash
# In PowerShell or CMD:
ver

# More detailed (PowerShell):
[System.Environment]::OSVersion.VersionString
(Get-WmiObject Win32_OperatingSystem).Caption
(Get-WmiObject Win32_OperatingSystem).Version
```

**Windows version mapping:**
| Build     | Name                    |
|-----------|-------------------------|
| 10.0.22631 | Windows 11 23H2        |
| 10.0.22621 | Windows 11 22H2        |
| 10.0.19045 | Windows 10 22H2        |
| 10.0.19044 | Windows 10 21H2        |
| 10.0.17763 | Windows Server 2019    |
| 6.3.9600   | Windows 8.1            |
| 6.1.7601   | Windows 7 SP1          |

**For WSL (Windows Subsystem for Linux):** detect Linux OS normally, then also check:
```bash
uname -r | grep -i microsoft && echo "Running under WSL"
cat /proc/version 2>/dev/null | grep -i microsoft
```

---

### 🐡 FreeBSD / OpenBSD / NetBSD

```bash
uname -a          # Full info: OS, hostname, version, arch
uname -r          # Release version
uname -m          # Machine arch
freebsd-version   # FreeBSD specific
```

---

### ☀️ Solaris / illumos / SmartOS

```bash
uname -a
cat /etc/release 2>/dev/null
```

---

## Step 3: Architecture Detection

Always include architecture in the output:

```bash
uname -m 2>/dev/null || arch 2>/dev/null
```

| Output          | Meaning                  |
|-----------------|--------------------------|
| `x86_64`        | 64-bit Intel/AMD         |
| `aarch64` / `arm64` | 64-bit ARM (Apple Silicon, AWS Graviton) |
| `armv7l`        | 32-bit ARM               |
| `i686` / `i386` | 32-bit Intel             |
| `ppc64le`       | PowerPC 64-bit LE        |
| `s390x`         | IBM Z/mainframe          |
| `riscv64`       | RISC-V 64-bit            |

---

## Step 4: Format the Output

Present a clean summary to the user:

```
OS:           Ubuntu 22.04.3 LTS (Jammy Jellyfish)
Kernel:       5.15.0-91-generic
Architecture: x86_64
```

Or for macOS:
```
OS:           macOS 14.4.1 (Sonoma)
Build:        23E224
Architecture: arm64 (Apple Silicon)
```

Or for Windows:
```
OS:           Windows 11 Pro (23H2)
Build:        10.0.22631
Architecture: x86_64
```

---

## Troubleshooting

- **No `uname`**: You're likely on native Windows CMD/PowerShell. Use PowerShell's WMI commands.
- **No `/etc/os-release`**: Try the distro-specific fallback files.
- **Docker/container**: You'll see the container's OS (usually Alpine or Debian-slim). Kernel version comes from the host.
- **WSL**: Report both the Linux distro AND note it's running under WSL on Windows.
- **Permission denied on files**: Try `sudo cat` or use `lsb_release -a` as an alternative.

---

## Quick One-Liner (Linux/macOS)

When you need a fast single-command summary:

```bash
{ echo "=== OS ==="; cat /etc/os-release 2>/dev/null || sw_vers 2>/dev/null || uname -a; echo "=== Kernel ==="; uname -r; echo "=== Arch ==="; uname -m; } 2>/dev/null
```
