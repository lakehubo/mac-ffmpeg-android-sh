#!/bin/bash
NDK_ROOT=/Users/lake/nbicc/ffmpegtest/android-ndk-r17c
#TOOLCHAIN 变量指向ndk中的交叉编译gcc所在的目录
TOOLCHAIN=$NDK_ROOT/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64
#FLAGS与INCLUDES变量 可以从AS ndk工程的.externativeBuild/cmake/debug/armeabi-v7a/build.ninja中拷贝，需要注意的是**地址**
FLAGS="-isystem $NDK_ROOT/sysroot/usr/include/aarch64-linux-android -D__ANDROID_API__=21 -g -DANDROID -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -march=armv8-a -Wa,--noexecstack -Wformat -Werror=format-security -O0 -fPIC"
INCLUDES="-isystem $NDK_ROOT/sources/cxx-stl/llvm-libc++/include -isystem $NDK_ROOT/sources/android/support/include -isystem $NDK_ROOT/sources/cxx-stl/llvm-libc++abi/include"

#执行configure脚本，用于生成makefile
#--prefix : 安装目录
#--enable-small : 优化大小
#--disable-programs : 不编译ffmpeg程序(命令行工具)，我们是需要获得静态(动态)库。
#--disable-avdevice : 关闭avdevice模块，此模块在android中无用
#--disable-encoders : 关闭所有编码器 (播放不需要编码)
#--disable-muxers :  关闭所有复用器(封装器)，不需要生成mp4这样的文件，所以关闭
#--disable-filters :关闭视频滤镜
#--enable-cross-compile : 开启交叉编译（ffmpeg比较**跨平台**,并不是所有库都有这么happy的选项 ）
#--cross-prefix: 看右边的值应该就知道是干嘛的，gcc的前缀 xxx/xxx/xxx-gcc 则给xxx/xxx/xxx-
#disable-shared enable-static 不写也可以，默认就是这样的。
#--sysroot: 
#--extra-cflags: 会传给gcc的参数
#--arch --target-os :
PREFIX=./android/arm64-v8a
./configure \
--prefix=$PREFIX \
--prefix=$PREFIX \
--enable-small \
--disable-programs \
--disable-avdevice \
--disable-encoders \
--disable-muxers \
--disable-filters \
--enable-cross-compile \
--cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
--disable-shared \
--enable-static \
--sysroot=$NDK_ROOT/platforms/android-21/arch-arm64 \
--extra-cflags="$FLAGS $INCLUDES" \
--extra-cflags="-isysroot $NDK_ROOT/sysroot" \
--arch=aarch64 \
--target-os=android 

make clean
make install