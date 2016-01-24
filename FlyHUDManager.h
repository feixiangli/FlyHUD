


#import <UIKit/UIKit.h>
#import "FlyHUD.h"

@interface FlyHUDManager : UIViewController

@property(nonatomic,retain)UIView*view2;

/**
 创建一个hud
 */
+(FlyHUD*)FlyHUDShowBGview:(UIView*)bgView;



/**
 停止一个hud
 */
+(void)FlyHUDDeleteHUD:(FlyHUD*)HUDView;


@end
