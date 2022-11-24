#!/bin/bash
set -e

printf "\e[0;36minstalling packages\e[0m\n"

apt-get update 
apt-get install -y curl file git unzip xz-utils zip

printf "\e[0;36minstalling packages done\e[0m\n"
printf "\e[0;36minstalling android SDK\e[0m\n"

/tmp/build_files/install_android_sdk.sh

printf "\e[0;36minstalling android SDK done\e[0m\n"
printf "\e[0;36minstalling flutter\e[0m\n"

/tmp/build_files/install_flutter.sh

printf "\e[0;36minstalling flutter done\e[0m\n"
printf "\e[0;36mbuild completed\e[0m\n"