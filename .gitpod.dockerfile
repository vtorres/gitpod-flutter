FROM gitpod/workspace-full:latest

LABEL maintainer="vitortorresvt@gmail.com"

USER root

RUN apt-get update -y
RUN apt-get install -y gcc make build-essential wget curl unzip apt-utils xz-utils libkrb5-dev gradle libpulse0 android-tools-adb android-tools-fastboot
RUN apt remove --purge openjdk-*-jdk
RUN apt-get install -y openjdk-8-jdk

USER gitpod

# Android
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV ANDROID_HOME="/home/gitpod/.android"
ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip"
ENV ANDROID_SDK_ARCHIVE="${ANDROID_HOME}/archive"
ENV ANDROID_STUDIO_PATH="/home/gitpod/"

RUN cd "${ANDROID_STUDIO_PATH}"
RUN wget -qO android-studio-2020.3.1.22-linux.tar.gz https://r3---sn-apn7en7l.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.22/android-studio-2020.3.1.22-linux.tar.gz
RUN tar -xf android-studio-2020.3.1.22-linux.tar.gz
RUN rm -f android-studio-2020.3.1.22-linux.tar.gz

RUN mkdir -p "${ANDROID_HOME}"
RUN touch $ANDROID_HOME/repositories.cfg
RUN wget -q "${ANDROID_SDK_URL}" -O "${ANDROID_SDK_ARCHIVE}"
RUN unzip -q -d "${ANDROID_HOME}" "${ANDROID_SDK_ARCHIVE}"
RUN mv "${ANDROID_HOME}/cmdline-tools" "${ANDROID_HOME}/cmdline-tools-temp"
RUN mkdir -p "${ANDROID_HOME}/cmdline-tools/latest"
RUN cp -r "${ANDROID_HOME}/cmdline-tools-temp/." "${ANDROID_HOME}/cmdline-tools/latest"
RUN echo y | "${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager" "platform-tools" "platforms;android-28" "build-tools;28.0.3"
RUN rm "${ANDROID_SDK_ARCHIVE}"

# Flutter
ENV FLUTTER_HOME="/home/gitpod/flutter"
RUN git clone https://github.com/flutter/flutter $FLUTTER_HOME
RUN $FLUTTER_HOME/bin/flutter channel master
RUN $FLUTTER_HOME/bin/flutter upgrade
RUN $FLUTTER_HOME/bin/flutter precache
RUN $FLUTTER_HOME/bin/flutter config --enable-web --no-analytics
RUN yes | "${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager"
ENV PUB_CACHE=/workspace/.pub_cache

# Env
RUN echo 'export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${PUB_CACHE}/bin:${FLUTTER_HOME}/.pub-cache/bin:$PATH' >>~/.bashrc
