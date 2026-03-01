#!/bin/bash

# Detects the operating system type, version, and architecture.
# Based on the strategy defined in SKILL.md.
# Supports text, json, and yaml output formats.

set -e

# --- Input Parameters ---
FORMAT=${1:-text} # Default to text

# --- Help Message ---
show_help() {
    echo "Usage: $(basename "$0") [format]"
    echo ""
    echo "Detects the operating system type, version, and architecture."
    echo ""
    echo "Arguments:"
    echo "  format    Output format: text (default), json, yaml"
    echo ""
    echo "Options:"
    echo "  --help, -h  Show this help message"
    exit 0
}

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    show_help
fi

# --- Step 1: Detect OS Family ---
OS_FAMILY=$(uname -s 2>/dev/null || echo "uname_unavailable")

# --- Step 2: Version Detection by OS ---
DISTRIBUTOR_ID=""
DESCRIPTION=""
RELEASE=""
CODENAME=""
KERNEL=$(uname -r 2>/dev/null || echo "unknown")
ARCHITECTURE=$(uname -m 2>/dev/null || arch 2>/dev/null || echo "unknown")
OS_NAME=""

case "$OS_FAMILY" in
    Linux)
        if command -v lsb_release > /dev/null 2>&1; then
            DISTRIBUTOR_ID=$(lsb_release -is)
            RELEASE=$(lsb_release -rs)
            DESCRIPTION=$(lsb_release -ds)
            CODENAME=$(lsb_release -cs)
        elif [ -f /etc/os-release ]; then
            . /etc/os-release
            DISTRIBUTOR_ID=$NAME
            RELEASE=$VERSION_ID
            DESCRIPTION=$PRETTY_NAME
            CODENAME="" # Not always available in os-release
        elif [ -f /etc/debian_version ]; then
            DISTRIBUTOR_ID="Debian"
            RELEASE=$(cat /etc/debian_version)
            DESCRIPTION="Debian $RELEASE"
        elif [ -f /etc/redhat-release ]; then
            DESCRIPTION=$(cat /etc/redhat-release)
            DISTRIBUTOR_ID="RedHat/CentOS/Fedora"
        fi
        
        # Check for WSL
        if uname -r | grep -i "microsoft" > /dev/null; then
            DESCRIPTION="$DESCRIPTION (Running under WSL)"
        fi
        OS_NAME=$DISTRIBUTOR_ID
        ;;

    Darwin)
        DISTRIBUTOR_ID="macOS"
        RELEASE=$(sw_vers -productVersion)
        DESCRIPTION="macOS $RELEASE"
        CODENAME=""
        
        case "$RELEASE" in
            15.*) CODENAME="Sequoia" ;;
            14.*) CODENAME="Sonoma" ;;
            13.*) CODENAME="Ventura" ;;
            12.*) CODENAME="Monterey" ;;
            11.*) CODENAME="Big Sur" ;;
            10.15*) CODENAME="Catalina" ;;
            10.14*) CODENAME="Mojave" ;;
            10.13*) CODENAME="High Sierra" ;;
        esac
        DESCRIPTION="$DISTRIBUTOR_ID $CODENAME ($RELEASE)"
        OS_NAME="macOS"
        ;;

    MINGW*|MSYS*|CYGWIN*)
        DISTRIBUTOR_ID="Windows"
        DESCRIPTION="Windows (via Git Bash/MSYS2/Cygwin)"
        OS_NAME="Windows"
        ;;

    FreeBSD|OpenBSD|NetBSD)
        DISTRIBUTOR_ID="$OS_FAMILY"
        RELEASE=$(uname -r)
        DESCRIPTION="$OS_FAMILY $RELEASE"
        OS_NAME="$OS_FAMILY"
        ;;

    SunOS)
        DISTRIBUTOR_ID="Solaris/illumos"
        DESCRIPTION=$(cat /etc/release 2>/dev/null | head -n 1)
        OS_NAME="Solaris/illumos"
        ;;

    *)
        DISTRIBUTOR_ID="$OS_FAMILY"
        DESCRIPTION="$OS_FAMILY $(uname -r)"
        OS_NAME="$OS_FAMILY"
        ;;
esac

# --- Step 4: Format the Output ---
case "$FORMAT" in
    json)
        cat <<EOF
{
  "os": "$OS_NAME",
  "distributor_id": "$DISTRIBUTOR_ID",
  "description": "$DESCRIPTION",
  "release": "$RELEASE",
  "codename": "$CODENAME",
  "kernel": "$KERNEL",
  "architecture": "$ARCHITECTURE"
}
EOF
        ;;
    yaml)
        cat <<EOF
os: $OS_NAME
distributor_id: $DISTRIBUTOR_ID
description: $DESCRIPTION
release: "$RELEASE"
codename: $CODENAME
kernel: $KERNEL
architecture: $ARCHITECTURE
EOF
        ;;
    text|*)
        echo "Distributor ID: $DISTRIBUTOR_ID"
        echo "Description:    $DESCRIPTION"
        echo "Release:        $RELEASE"
        echo "Codename:       $CODENAME"
        echo "Kernel:         $KERNEL"
        echo "Architecture:   $ARCHITECTURE"
        ;;
esac
