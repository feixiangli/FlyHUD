

#import "ViewController.h"
#import "FlyHUDManager.h"


@interface ViewController ()

@end

@implementation ViewController
{
    FlyHUD * flyhud;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor redColor];
    
    flyhud=[FlyHUDManager FlyHUDShowBGview:self.view];
    


    [self performSelector:@selector(StopHUD) withObject:nil afterDelay:3];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)StopHUD
{
    [FlyHUDManager FlyHUDDeleteHUD:flyhud];
    
    NSLog(@"123213");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
