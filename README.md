# mac-ffmpeg-android-sh
Mac  系统下 编译 ffmpeg 脚本文件
>编译ffmpeg前 请确认已经准备好ffmpeg release版本 ndk小于或者等于17c版本

在mac系统偏好设置里安全与隐私中 隐私一栏中，完全的磁盘访问权限中将终端置勾

将将本置于ffmpeg根目录中 并在终端中给予该脚本执行权限
```
chmod 777 xxxxx.sh

//执行编译
sh build_android.sh
//编译完成后 进行合并静态库
sh mixatoso.sh
```

编译生成的文件将在ffmpeg/android/路径下



