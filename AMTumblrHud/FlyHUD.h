#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlyHUD : UIView

@property (nonatomic, strong) UIColor *hudColor;





-(void)showAnimated:(BOOL)animated;

-(void)hide:(FlyHUD*)FLyhud;

@end