#android版本号定义说明

>在应用程序的manifest文件中定义应用程序版本信息.

2个必须同时定义的属性:

android:versionCode — 整型, 相对于其他种类的版本号而言, 表示应用程序代码的版本. 其值是个整型,因此其他应用程序可以在程序编码中判断它, 例如检查升级或降级关系. 可以对其设置任何值, 然而应当确保每一个后续发布的应用程序使用更大的值. 尽管系统并不强制执行这种规则, 但是每个后续版本使用增加的数字值是标准作法. 典型做法是, 你发布的第一个版本的versionCode为1, 然后以后的每个发布版本单调递增, 而不管这个发布版本是否是一个主要或者次要的发布版本. 这表示 android:versionCode 值没有必要与用户可见的应用程序发布版本号有特别的相似之处. 同时,应用程序和发布平台不应将此版本值呈现给用户.

android:versionName --- 字符串值,向用户显示的应用程序代码的发布版本号.  此值是一个字符串, 因此可以用<major>.<minor>.<point>的形式描述应用程序版本, 或者以任何其他类型的绝对或相对版本号标识的形式. 相对于 android:versionCode, 除了让应用程序向用户显示它以外, 系统不打算将这个值用于任何内部使用目的. 应用发布平台可能会将 android:versionName 值解析出来显示给用户. 在manifest文件的<manifest>元素中同时定义这些个版本相关属性.

例子如下:
```
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.package.name" 
        android:versionCode="2"
        android:versionName="1.1"> 
    <application android:icon="@drawable/icon" android:label="@string/app_name">
        ... 
    </application> 
</manifest>
```
在例子中, 注意 android:versionCode 值显示当前的.apk包含了应用程序代码的第二个发布, android:versionName字符串表现的是一个小的后继发布版本. 

Android 提供了一个API以让应用程序向系统查询版本信息. 使用 PackageManager 的 getPackageInfo(java.lang.String, int)方法.例如：
PackageManager manager = this.getPackageManager();
try {
        PackageInfo info = manager.getPackageInfo(this.getPackageName(), 0);
        appVersion = info.versionName; // 版本名，versionCode同理
} catch (NameNotFoundException e) {
        e.printStackTrace();
}

指定应用程序的系统API需求
如果应用需要指定一个Android平台的最小版本号, 或者是设计为仅支持一个特定的Android平台版本范围, 可以在应用程序的manifest文件中以API Level标识符形式指定. 这么做确保应用可以仅被安装在运行着兼容版本的Android设备中.
要指定API Level, 在应用程序的manifest文件中添加一个<uses-sdk>元素, 然后指定一个或多个以下这些属性:
android:minSdkVersion — 应用程序运行的最小Android平台版本, 由平台的API Level标识指定.

android:targetSdkVersion — 指定应用设计运行的API Level. 在一些情况下, 这允许应用程序使用目标API Level中的manifest元素或者行为, 而不是被限制在仅使用最小API Level中的元素.

android:maxSdkVersion - 应用设计运行的Android平台的最大版本, 由平台的API Level标识指定. 重要: 在使用这个属性之前, 请阅读 <uses-sdk> 文档.
当准备安装应用时, 系统检查这些个属性的值, 并与系统版本比较. 如果 android:minSdkVersion 的值比系统版本号要高, 系统将中断应用程序的安装. 类似地, 系统仅在应用程序的 android:maxSdkVersion 和平台版本兼容的的情况下安装应用程序.
如果在manifest中没有指定这些属性, 系统会假设应用程序和所有平台版本兼容, 没有最大API Level的限制.
若要为应用程序指定最小平台版本, 需要在<manifest>下添加一个<uses-sdk>子元素, 然后定义android:minSdkVersion属性.
更多的信息, 请参见 <uses-sdk> manifest元素和API Level的文档.