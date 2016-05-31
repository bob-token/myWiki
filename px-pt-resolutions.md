px：(pixels)（像素）：屏幕上的点，与密度相关。密度大了，单位面积上的px会比较多。表示屏幕实际的象素。例如，320*480的屏幕在横向有320个象素，在纵向有480个象素。

dip或dp（与密度无关的像素）。这个和设备硬件有关，为了支持WVGA、HVGA和QVGA 5进制空间推荐使用这个。一种基于屏幕密度的抽象单位。设置一些view的宽高可以用这个，一般情况下，在不同分辨率，都不会有缩放的感觉。如果用px的话，320px占满HVGA的宽度，到WVGA上就只能占一半不到的屏幕了，那一定不是你想要的。

sp（与刻度无关的像素）放大像素– 主要处理字体的大小。

in：表示英寸，是屏幕的物理尺寸。每英寸等于2.54厘米。例如，形容手机屏幕大小，经常说，3.2（英）寸、3.5（英）寸、4（英）寸就是指这个单位。这些尺寸是屏幕的对角线长度。如果手机的屏幕是3.2英寸，表示手机的屏幕（可视区域）对角线长度是3.2*2.54 = 8.128厘米。读者可以去量一量自己的手机屏幕，看和实际的尺寸是否一致。

mm：表示毫米，是屏幕的物理尺寸。

pt：表示一个点，是屏幕的一个物理长度，大小为1英寸的1/72。

**换算公式：**
px = (density/160)dp
density一般为3个常用固定值240/160/120



##分辨率和像素

**经新xcode6模拟器验证（分辨率为pt，像素为真实pixel）：**

iPhone4分辨率320x480，像素640x960，@2x<br>
iPhone5分辨率320x568，像素640x1136，@2x<br>
iPhone6分辨率375x667，像素750x1334，@2x<br>
iPhone6 Plus分辨率414x736，像素1242x2208，@3x，

***iPhone6 Plus***
```objective-c
    CGRect screen = [UIScreen mainScreen].bounds;
    screen = (width = 414, height = 736)
```
（注意，在这个分辨率下渲染后，图像等比降低pixel分辨率至1080p(1080x1920)）<br>
rel:[ultimate-guide-to-iphone-resolutions](http://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

![iphone_resolutions](uploads/iphone_resolutions.jpg)