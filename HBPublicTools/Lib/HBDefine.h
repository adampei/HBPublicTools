
#import "HBNetTool.h"
#import "HBToast.h"
#import "NSObject+HBPublicTool.h"

//-------------------颜色相关------------------
// rgb颜色转换（16进制->10进制）
#define KColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KWhiteColor [UIColor whiteColor]
#define KClearColor [UIColor clearColor]
#define KRedColor   [UIColor redColor]
#define KBlackColor [UIColor blackColor]

#define KColor_RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]


//--------------------系统宏--------------------------
/** app版本号 */
#define KVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 偏好设置 */
#define KUser_Defult [NSUserDefaults standardUserDefaults]

/** 设备标示 */
#define KUUID ([[[UIDevice currentDevice] identifierForVendor] UUIDString])

/** frame */
#define KFrame(a,b,c,d) CGRectMake(a, b, c, d)

/** bundle */
#define KMainBundel [NSBundle mainBundle]
/** 偏好 */
#define KUser_Default [NSUserDefaults standardUserDefaults]
/** 通知中心 */
#define KNotification_Center [NSNotificationCenter defaultCenter]
/** 获取系统版本 */
#define KIOS_Version_FloatValue [[[UIDevice currentDevice] systemVersion] floatValue]
/** 获取系统版本 */
#define KIOS_Version_String [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define KCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//检查系统版本
#define KSystem_Version_Equal_To(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define KSystem_Version_Greater_Than(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define KSystem_Version_Greater_Than_Or_Equal_To(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define KSystem_Version_Less_Than(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define KSystem_Version_Less_Than_Or_Equal_To(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//-----------------------尺寸-------------------------
/* 屏幕宽度 */
#define KScreen_Width ([UIScreen mainScreen].bounds.size.width)
/** 屏幕高度 */
#define KScreen_Height ([UIScreen mainScreen].bounds.size.height)
/** 屏幕bounds */
#define KScreen_Bounds ([UIScreen mainScreen].bounds)

//----------------------适配屏幕宽高--------------------
/** 宽度适配 */
#define KWidth_Scale(number) (([UIScreen mainScreen].bounds.size.width * number) / 320)

/** 高度适配 */
#define KHeight_Scale(number) (([UIScreen mainScreen].bounds.size.height * number) / 568)

//----------------------打印--------------------
#ifdef DEBUG
#   define KLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define KLog(...)
#endif