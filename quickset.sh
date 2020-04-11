#!/bin/sh

QUICKSET_VERSION=0.0.0.2;
 


get_os_name_and_version () {
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        OS=Debian
        VER=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        ...
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        ...
    elif sw_vers -productVersion; then
        OS="macos"
        VER=${1-:$(sw_vers -productVersion)}
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        OS=$(uname -s)
        VER=$(uname -r)
    fi
}
# From Mikel @ https://unix.stackexchange.com/a/6348


clear;
get_os_name_and_version;
echo "";
echo "\e[96m---------------------------------------------------";
echo "             .__        __                   __   \n  ________ __|__| ____ |  | __  ______ _____/  |_ \n / ____/  |  \  |/ ___\|  |/ / /  ___// __ \   __\\n< <_|  |  |  /  \  \___|    <  \___ \\  ___/|  |  \n \__   |____/|__|\___  >__|_ \/____  >\___  >__|  \n    |__|             \/     \/     \/     \/      ";
echo "";
echo "\e[93mquickset \e[94mv$QUICKSET_VERSION\e[96m running for $OS $VER\n";
printf "Auto updating quickset for next run...."
sudo sh -c 'curl -fsSL https://raw.githubusercontent.com/onesupercoder/quickset/master/quickset.sh > /usr/local/bin/quickset';
printf " Done.\n";
echo " ";
echo "---------------------------------------------------\e[0m";
echo " ";


echo $1;