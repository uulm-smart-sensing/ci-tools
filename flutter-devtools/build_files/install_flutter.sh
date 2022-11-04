#!/bin/bash
set -e
set -x

# download & extract flutter
curl $FLUTTER_DOWNLOAD_URL -o flutter.tar.xz
tar -xf flutter.tar.xz -C /
rm flutter.tar.xz

# calm down git
git config --global --add safe.directory /flutter

# update path
echo 'export PATH="/flutter/bin:$PATH"' >> /root/.bashrc
export PATH="/flutter/bin:$PATH"

# disable analytics
flutter config --no-analytics
dart --disable-analytics

# configure target arch
flutter config --no-enable-web --no-enable-linux-desktop --no-enable-macos-desktop --no-enable-windows-desktop --no-enable-fuchsia --no-enable-custom-devices --enable-android --enable-ios

# set android sdk path
flutter config --android-sdk /android

# check if everything is good
flutter doctor -v