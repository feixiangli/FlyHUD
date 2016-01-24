//
//  FlyHUDManager.m
//  FlyHUD
//
//  Created by 李飞翔 on 16/1/24.
//  Copyright © 2016年 Fly. All rights reserved.
//

#import "FlyHUDManager.h"

@interface FlyHUDManager ()

@end

@implementation FlyHUDManager
{
    FlyHUD *hudM ;
}

+(FlyHUD*)FlyHUDShowBGview:(UIView*)bgView
{
    
    FlyHUD *hud = [[FlyHUD alloc] init];
    
    [bgView addSubview:hud];
    
    [hud showAnimated:YES];

    return hud;
    
}




+(void)FlyHUDDeleteHUD:(FlyHUD*)HUDView;
{
    [HUDView hide:HUDView];
}

@end
