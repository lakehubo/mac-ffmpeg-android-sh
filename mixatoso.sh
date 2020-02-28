#NDK_ROOT ndk所在路径**需要携程自己电脑的ndk路径**
NDK_ROOT=/Users/lake/nbicc/ffmpegtest/android-ndk-r17c
#TOOLCHAIN 变量指向ndk中的交叉编译gcc所在的目录，ndk版本：android-ndk-r17c-darwin-x86_64
TOOLCHAIN=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
#此变量用于编译完成之后的库与头文件存放在哪个目录
PREFIX=./android/armeabi-v7a
PLATFORM=$NDK_ROOT/platforms/android-21/arch-arm

$TOOLCHAIN/bin/arm-linux-androideabi-ld \
-rpath-link=$PLATFORM/usr/lib \
-L$PLATFORM/usr/lib \
-L$PREFIX/lib \
-soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o \
$PREFIX/libffmpeg.so \
android/armeabi-v7a/lib/libavcodec.a \
android/armeabi-v7a/lib/libavfilter.a \
android/armeabi-v7a/lib/libswresample.a \
android/armeabi-v7a/lib/libavformat.a \
android/armeabi-v7a/lib/libavutil.a \
android/armeabi-v7a/lib/libswscale.a \
-lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker \
$TOOLCHAIN/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a