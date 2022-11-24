FROM ubuntu:22.04

ARG flutter_version=3.3.7
ENV FLUTTER_DOWNLOAD_URL=https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz
ENV ANDROID_COMMANDLINE_TOOLS_DOWNLOAD_URL=https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip

# Copy files
COPY build_files /tmp/build_files

# Run build script
RUN  /tmp/build_files/build_script.sh && rm -r /tmp/*