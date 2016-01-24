#import "FlyHUD.h"

#define kShowHideAnimateDuration 0.2
#define HUDBOUNDS [UIScreen mainScreen].bounds
#define HUDRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


static FlyHUD *_sharedInstance = nil;

@implementation FlyHUD
{
    NSMutableArray *hudRects;
}

- (id)init{
    
    self = [super initWithFrame:CGRectMake((CGFloat) ((HUDBOUNDS.size.width - 55) * 0.5),
                                           (CGFloat) ((HUDBOUNDS.size.height - 20) * 0.5), 55, 20)];
    if (self) {
        [self configUI];
        self.userInteractionEnabled = NO;
        self.alpha = 0;
    }
    return self;
}

#pragma mark - config UI

- (void)configUI {
    self.backgroundColor = [UIColor clearColor];
    
    UIView *rect1 = [self drawRectAtPosition:CGPointMake(0, 0)];
    UIView *rect2 = [self drawRectAtPosition:CGPointMake(20, 0)];
    UIView *rect3 = [self drawRectAtPosition:CGPointMake(40, 0)];
    
    [self addSubview:rect1];
    [self addSubview:rect2];
    [self addSubview:rect3];
    
    [self doAnimateCycleWithRects:@[rect1, rect2, rect3]];
}

#pragma mark - animation

- (void)doAnimateCycleWithRects:(NSArray *)rects {
    __weak typeof(self) wSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.25 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wSelf animateRect:rects[0] withDuration:0.25];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.25 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [wSelf animateRect:rects[1] withDuration:0.2];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.2 * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wSelf animateRect:rects[2] withDuration:0.15];
            });
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [wSelf doAnimateCycleWithRects:rects];
    });
}

- (void)animateRect:(UIView *)rect withDuration:(NSTimeInterval)duration {
    [rect setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    
    [UIView animateWithDuration:duration
                     animations:^{
                         rect.alpha = 1;
                         rect.transform = CGAffineTransformMakeScale(1, 1.3);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration
                                          animations:^{
                                              rect.alpha = 0.5;
                                              rect.transform = CGAffineTransformMakeScale(1, 1);
                                          } completion:^(BOOL f) {
                                          }];
                     }];
}

#pragma mark - drawing

- (UIView *)drawRectAtPosition:(CGPoint)positionPoint {
    UIView *rect = [[UIView alloc] init];
    CGRect rectFrame;
    rectFrame.size.width = 15;
    rectFrame.size.height = 16.5;
    rectFrame.origin.x = positionPoint.x;
    rectFrame.origin.y = 0;
    rect.frame = rectFrame;
    rect.backgroundColor = HUDRGBColor(33, 121, 250);
    rect.alpha = 0.5;
    rect.layer.cornerRadius = 0;
    
    if (hudRects == nil) {
        hudRects = [[NSMutableArray alloc] init];
    }
    [hudRects addObject:rect];
    
    return rect;
}

#pragma mark - Setters

- (void)setHudColor:(UIColor *)hudColor {
    for (UIView *rect in hudRects) {
        
//        UIColor*color=[UIColor colorWithRed:33/255 green:121/255 blue:250/255 alpha:0.97];

        rect.backgroundColor = HUDRGBColor(33, 1, 250);
    }
}

#pragma mark -
#pragma mark - show / hide

-(void)hide:(FlyHUD*)FLyhud{
    
    if (FLyhud) {
        [UIView animateWithDuration:0.5 animations:^{
            FLyhud.alpha = 0;
        } completion:^(BOOL finished) {
            [FLyhud removeFromSuperview];
        }];
    }
}

- (void)showAnimated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 1;
        }];
    } else {
        self.alpha = 1;
    }
}

- (void)dealloc {
    hudRects = nil;
}

@end