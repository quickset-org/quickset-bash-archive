#!/bin/bash
set -e;

QUICKSET_VERSION=0.0.0.2;
QUICKSET_RECIPE=$1;
QUICKSET_REPO="https://raw.githubusercontent.com/onesupercoder/quickset/master/";

get_os_name_and_version () {
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        QUICKSET_FOUND_OS=$NAME
        QUICKSET_FOUND_OS_VERSION=$VERSION_ID
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        QUICKSET_FOUND_OS=$(lsb_release -si)
        QUICKSET_FOUND_OS_VERSION=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        QUICKSET_FOUND_OS=$DISTRIB_ID
        QUICKSET_FOUND_OS_VERSION=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
        # Older Debian/Ubuntu/etc.
        QUICKSET_FOUND_OS=Debian
        QUICKSET_FOUND_OS_VERSION=$(cat /etc/debian_version)
    elif [ -f /etc/SuSe-release ]; then
        # Older SuSE/etc.
        ...
    elif [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentQUICKSET_FOUND_OS, etc.
        ...
    elif sw_vers -productVersion; then
        QUICKSET_FOUND_OS="macos"
        QUICKSET_FOUND_OS_VERSION=${1-:$(sw_vers -productVersion)}
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        QUICKSET_FOUND_OS=$(uname -s)
        QUICKSET_FOUND_OS_VERSION=$(uname -r)
    fi
}
# From Mikel @ https://unix.stackexchange.com/a/6348


clear;
get_os_name_and_version;


echo "";
echo -e "\e[96m---------------------------------------------------";
echo -e "             .__        __                   __   \n  ________ __|__| ____ |  | __  ______ _____/  |_ \n / ____/  |  \  |/ ___\|  |/ / /  ___// __ \   __\\n< <_|  |  |  /  \  \___|    <  \___ \\  ___/|  |  \n \__   |____/|__|\___  >__|_ \/____  >\___  >__|  \n    |__|             \/     \/     \/     \/      ";
echo "";
echo -e "\e[93mquickset \e[94mv$QUICKSET_VERSION\e[96m running for $QUICKSET_FOUND_OS $QUICKSET_FOUND_OS_VERSION\n";
printf "Auto updating quickset for next run...."

sudo bash -c "curl -fsSL "${QUICKSET_REPO}"quickset.sh > /usr/local/bin/quickset";
printf " Done.\n";
echo " ";
echo -e "---------------------------------------------------\e[0m";
echo " ";


[ "$#" -eq 1 ] || die "Error: Please provide one quickset recipe, $# provided"

QUICKSET_EXACT_RECIPE="$QUICKSET_RECIPE/$QUICKSET_FOUND_OS/$QUICKSET_FOUND_OS_VERSION";
echo "Attempting quickset for $QUICKSET_EXACT_RECIPE";

firstString="I love Suzi and Marry"
secondString="Sara"
echo "${firstString/Suzi/$secondString}"    

IFS='.'; # read delimiter
read -ra QUICKSET_OS_VERSION_ARRAY <<< "$QUICKSET_FOUND_OS_VERSION"; # str is read into an array as tokens separated by IFS


for (( i=${#QUICKSET_OS_VERSION_ARRAY[@]}-1; i>=0; i-- ))
  do QUICKSET_OS_VERSION_ARRAY_SORTED[${#QUICKSET_OS_VERSION_ARRAY_SORTED[@]}]=${QUICKSET_OS_VERSION_ARRAY[i]}
done;


QUICKSET_FOUND_PATH=false

QUICKSET_RECIPE_URL=""

for i in "${QUICKSET_OS_VERSION_ARRAY_SORTED[@]}"
do
    if \("$QUICKSET_FOUND_PATH" = false\) -a \(curl --output /dev/null --silent --head --fail "$url"\); then
        QUICKSET_FOUND_PATH=true
    else
        echo "URL does not exist: $url"
    fi
   echo "$i"
   
   curl -fsSL
   # or do whatever with individual element of the array
done

if [ "$QUICKSET_FOUND_PATH" = true ] ; then
    echo 'Be careful not to fall off!'
fi

