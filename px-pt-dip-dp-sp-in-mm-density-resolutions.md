##名词解释:
px：(pixels)（像素）：屏幕上的点，与密度相关。密度大了，单位面积上的px会比较多。表示屏幕实际的象素。例如，320*480的屏幕在横向有320个象素，在纵向有480个象素。

dip或dp（与密度无关的像素）。这个和设备硬件有关，为了支持WVGA、HVGA和QVGA 推荐使用这个。一种基于屏幕密度的抽象单位。设置一些view的宽高可以用这个，一般情况下，在不同分辨率，都不会有缩放的感觉。如果用px的话，320px占满HVGA的宽度，到WVGA上就只能占一半不到的屏幕了。

sp（与刻度无关的像素）放大像素– 主要处理字体的大小。

in：表示英寸，是屏幕的物理尺寸。每英寸等于2.54厘米。例如，形容手机屏幕大小，经常说，3.2（英）寸、3.5（英）寸、4（英）寸就是指这个单位。这些尺寸是屏幕的对角线长度。如果手机的屏幕是3.2英寸，表示手机的屏幕（可视区域）对角线长度是3.2*2.54 = 8.128厘米。

mm：表示毫米，是屏幕的物理尺寸。

pt：表示一个点，是屏幕的一个物理长度，大小为1英寸的1/72。

DPI:原来是印刷上的记量单位，意思是每英寸上，所能印刷的网点数（Dot Per Inch）。但随着数字输入，输出设备快速发展，大多数的人也将数字影像的解析度用DPI表示，但较为严谨的人可能注意到，印刷时计算的网点（Dot）和电脑显示器的显示像素（Pixel）并非相同，所以较专业的人士，会用PPI(Pixel Per Inch)表示数字影像的解析度。

PPI： Pixels per inch，每英寸上的像素数,即 “像素密度”

Density: 指每平方英寸中的像素数。
**Density=Resolution/Screen size**<br>


##android分辨率和像素
HVGA屏density=160<br>
QVGA屏density=120<br>
WVGA屏density=240<br>
WQVGA屏density=120<br>

**手机常见分辨率:**
```java
4:3
VGA     640*480 (Video Graphics Array)
QVGA  320*240 (Quarter VGA)
HVGA  480*320 (Half-size VGA)
SVGA  800*600 (Super VGA)
5:3
WVGA  800*480 (Wide VGA)
16:9
FWVGA 854*480 (Full Wide VGA)
HD        1920*1080 High Definition
QHD     960*540
720p    1280*720  标清
1080p  1920*1080 高清
手机:
iphone 4/4s    960*640 (3:2)
iphone5         1136*640
小米1             854*480(FWVGA)
小米2             1280*720
分辨率对应DPI
"HVGA    mdpi"
"WVGA   hdpi "
"FWVGA hdpi "
"QHD      hdpi "
"720P     xhdpi"
"1080P   xxhdpi "
```

**换算公式：**
pixels = dips * (density / 160)
***density一般为3个常用固定值240/160/120***

**获取屏幕尺寸 4.7" WXGA Resolution:720 x 1280  density:xhdpi Ratio:long Size:normal**
```java
        DisplayMetrics metric = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(metric);
        int width = metric.widthPixels;  // 屏幕宽度（像素）=720
        int height = metric.heightPixels;  // 屏幕高度（像素）=1280
        float density = metric.density;  // 屏幕密度（0.75 / 1.0 / 1.5）=2.0
        int densityDpi = metric.densityDpi;  // 屏幕密度DPI（120 / 160 / 240）=320
        //获取的结果
        DisplayMetrics{density=2.0, width=720, height=1280, scaledDensity=2.0, xdpi=320.0, ydpi=320.0}
```
***android dp/px换算代码***
```java
import android.util.DisplayMetrics;

/**
 * 计算公式 pixels = dips * (density / 160)
 * 
 * @version 1.0.1 2010-12-11
 * 
 * @author
 */
public class DensityUtil {
	
	private static final String TAG = DensityUtil.class.getSimpleName();
	
	// 当前屏幕的densityDpi
	private static float dmDensityDpi = 0.0f;
	private static DisplayMetrics dm;
	private static float scale = 0.0f;

	/**
	 * 
	 * 根据构造函数获得当前手机的屏幕系数
	 * 
	 * */
	public DensityUtil(Context context) {
		// 获取当前屏幕
		dm = new DisplayMetrics();
		dm = context.getApplicationContext().getResources().getDisplayMetrics();
		// 设置DensityDpi
		setDmDensityDpi(dm.densityDpi);
		// 密度因子
		scale = getDmDensityDpi() / 160;
		Logger.i(TAG, toString());
	}

	/**
	 * 当前屏幕的density因子
	 * 
	 * @param DmDensity
	 * @retrun DmDensity Getter
	 * */
	public static float getDmDensityDpi() {
		return dmDensityDpi;
	}

	/**
	 * 当前屏幕的density因子
	 * 
	 * @param DmDensity
	 * @retrun DmDensity Setter
	 * */
	public static void setDmDensityDpi(float dmDensityDpi) {
		DensityUtil.dmDensityDpi = dmDensityDpi;
	}

	/**
	 * 密度转换像素
	 * */
	public static int dip2px(float dipValue) {

		return (int) (dipValue * scale + 0.5f);

	}

	/**
	 * 像素转换密度
	 * */
	public int px2dip(float pxValue) {
		return (int) (pxValue / scale + 0.5f);
	}

	@Override
	public String toString() {
		return " dmDensityDpi:" + dmDensityDpi;
	}
}
```

下面以480dip*800dip的WVGA(density=240)为例，详细列出不同density下屏幕分辨率信息：

当density=120时 屏幕实际分辨率为240px*400px （两个点对应一个分辨率）
状态栏和标题栏高各19px或者25dip
横屏是屏幕宽度400px 或者800dip,工作区域高度211px或者480dip
竖屏时屏幕宽度240px或者480dip,工作区域高度381px或者775dip

density=160时 屏幕实际分辨率为320px*533px （3个点对应两个分辨率）
状态栏和标题栏高个25px或者25dip
横屏是屏幕宽度533px 或者800dip,工作区域高度295px或者480dip
竖屏时屏幕宽度320px或者480dip,工作区域高度508px或者775dip

density=240时 屏幕实际分辨率为480px*800px （一个点对于一个分辨率）
状态栏和标题栏高个38px或者25dip
横屏是屏幕宽度800px 或者800dip,工作区域高度442px或者480dip
竖屏时屏幕宽度480px或者480dip,工作区域高度762px或者775dip

apk的资源包中，当屏幕density=240时使用hdpi标签的资源
当屏幕density=160时，使用mdpi标签的资源
当屏幕density=120时，使用ldpi标签的资源。
不加任何标签的资源是各种分辨率情况下共用的。
建议：布局时尽量使用单位dip，少使用px。

device independent pixels(设备独立像素). 不同设备有不同的显示效果,这个和设备硬件有关，一般我们为了支持WVGA、HVGA和QVGA 推荐使用这个，不依赖像素。

##iOS分辨率和像素

**经新xcode6模拟器验证（分辨率为pt，像素为真实pixel）：**

iPhone4 pt(point):320x480，像素640x960，@2x<br>
iPhone5 pt(point):320x568，像素640x1136，@2x<br>
iPhone6 pt(point):375x667，像素750x1334，@2x<br>
iPhone6 Plus pt(point):414x736，像素1242x2208，@3x，

***iPhone6 Plus***
```objective-c
    CGRect screen = [UIScreen mainScreen].bounds;
    screen = (width = 414, height = 736)
```
（注意，在这个分辨率下渲染后，图像等比降低pixel分辨率至1080p(1080x1920)）<br>
rel:[ultimate-guide-to-iphone-resolutions](http://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

![iphone_resolutions](uploads/iphone_resolutions.jpg)