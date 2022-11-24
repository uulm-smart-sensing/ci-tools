#!/bin/bash
set -e
set -x

# install java
apt-get install -y default-jdk

# download & extract cmdline-tools
curl $ANDROID_COMMANDLINE_TOOLS_DOWNLOAD_URL -o android_cmd_tools.zip
unzip android_cmd_tools.zip -d /tmp
rm android_cmd_tools.zip

# get version of cmdline-tools
cli_version=$(/tmp/cmdline-tools/bin/sdkmanager --version --sdk_root=/tmp | head -n1)

# move cmdline-tools to android folder
mkdir -p /android/cmdline-tools/$cli_version
mv tmp/cmdline-tools/* android/cmdline-tools/$cli_version

# install packages & accept licenses
yes | /android/cmdline-tools/$cli_version/bin/sdkmanager --install "system-images;android-33;google_apis;x86_64" "platform-tools" "platforms;android-33" "build-tools;33.0.0"
yes | /android/cmdline-tools/$cli_version/bin/sdkmanager --licenses 

# update path
echo 'export PATH="/android/platform-tools:/android/cmdline-tools/'$cli_version'/bin:$PATH"' >> /root/.bashrc