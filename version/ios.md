#ios App 版本号定义说明

格式定义

version#（版本编号）

    = version number in iTunes Connect

    = Bundle versions string, short in Xcode；

    = CFBundleShortVersionString in Info.plist；

    遵循软件版本一般约定，使用三段式 x.y.z，如 0.5.1。若 z 为0，则通常省略，比如：记为 1.1 而不是 1.1.0。

没有特别说明，我们所说的 版本 指的就是这个意义上的版本编号。

通过 iTunes Connect 提交 Apple 时使用。

iTunes Connect 对 version 的要求：

    The version number of the app you are adding. Numbering should follow software versioning conventions.

build#（build编号）

    = Bundle version in Xcode。

    = CFBundleVersion in Info.plist

    选用一个正整数来表示build#，每构建/提测一次，这个数字就加1。

    如：上次构建/提测为1，则本次就是2，下次就是3。

没有特别说明，Bundle version 这个术语等同于 build#。

version number in iTunes Connect

    和 Bundle versions string, short 保持一致，即上面说的 version#。

扩展版本

    选用：version# (role#build#)，如 0.5.1 (C2)；

    其中：role# 表示角色编号，B 表示 经纪人版，C 表示 客户版；version# 后面有一个空格；

App About（关于）

    正式版：依扩展版本格式定义，如：0.5.1 (C2)；

    开发版：扩展版本格式后加 D，如：0.5.1 (C2) D。

禅道

在禅道中构建/提测时，遵循扩展版本格式定义。

    x.y.z 的含义

    x 大更新

    major updates of the application, such as updates that implement new features or major changes. 自然地，0 则表示产品尚未成型。

    y 小更新

    The second integer denotes revisions that implement less prominent features.

    z 维护更新

    The third integer represents maintenance releases. 比如：上线后发现问题，修正后，z 就要加 1。z从0开始。

x, y, z 的约定

取值范围

    x, y, z 必须为 0 或者 正整数，数字前请不要用0做前缀。2.1.6 是合适的，而 2.1.06 就匪夷所思，不合适。

版本比较算法

    版本的大小比较是以逗点分割后，逐段比较数字大小，比如：2.1.11 比 2.1.3 版本高，因为 11 > 3；1.3.4 比 1.2.9 版本高，因为 3 > 2。

内部可直接使用 role#build# 称呼打包编号

    因为 build# 单一且始终增长，具有简单性、连续性和唯一指向性。比如 C3 包，B5 包，在开发团队内部交流时使用会方便很多。

对 iOS App "version" 的理解

Bundle versions string, short in Xcode

    软件的显示版本，显示在 App Store 里面，用户能看到的包的版本号。

Bundle version in Xcode

    通常理解为 Build 编号；

    需要不断增长，既是语义的要求、可理解的要求，同时在 iTunes Connect 提交时也有新版本要比上一个版本高这个要求；

    和 Bundle versions string, short 没有固定关系。

version number in iTunes Connect

    在 iTunes Connect 提交认证包时，你需要填写版本编号。应当和 Bundle versions string, short 保持一致。

iTunes Connect Developer Guide 在 General App Information 章节 对 Version Number Property 的描述：

    The version number of the app you’re adding. This is the version number that will display on the App Store for customers

    Numbering should follow typical software versioning conventions (for example, 1.0 , 1.0.1 , 1.1 ).

    Important: Make sure this App Store version number matches the version number set in the bundle. If these don’t match, upload errors for later updates might occur.


CFBundleVersion

    在 Info.plist 文件中，你会看到 CFBundleVersion 这个 key，她的值就是 Bundle version 的值。

CFBundleShortVersionString

    在 Info.plist 文件中，其值为 Bundle Versions String, Short 的值。

Info.plist 

    Property list 文件使用扩展文件名 .plist，称为 p-list 文件，通常用来存储用户设置，也常用来存储关于 bundles and applications 的信息，这是一个xml文件。
