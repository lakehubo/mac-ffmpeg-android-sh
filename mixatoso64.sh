#!/bin/bash
NDK_ROOT=/Users/lake/nbicc/ffmpegtest/android-ndk-r17c
#TOOLCHAIN 变量指向ndk中的交叉编译gcc所在的目录
TOOLCHAIN=$NDK_ROOT/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
#此变量用于编译完成之后的库与头文件存放在哪个目录
PREFIX=./android/arm64-v8a
PLATFORM=$NDK_ROOT/platforms/android-21/arch-arm64

$TOOLCHAIN/bin/aarch64-linux-android-ld \
-rpath-link=$PLATFORM/usr/lib \
-L$PLATFORM/usr/lib \
-L$PREFIX/lib \
-soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
$PREFIX/libffmpeg.so \
android/arm64-v8a/lib/libavcodec.a \
android/arm64-v8a/lib/libavfilter.a \
android/arm64-v8a/lib/libswresample.a \
android/arm64-v8a/lib/libavformat.a \
android/arm64-v8a/lib/libavutil.a \
android/arm64-v8a/lib/libswscale.a \
-lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
$TOOLCHAIN/lib/gcc/aarch64-linux-android/4.9.x/libgcc.a