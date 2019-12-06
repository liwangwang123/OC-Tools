//
//  MYHUDTool.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/24.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYHUDTool.h"

@implementation MYHUDTool
+ (MBProgressHUD *)show:(NSString *)text icon:(NSString *)icon andTime:(NSTimeInterval)time
{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    // 初始化 MBProgressHUD
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置hud文字
    //    hud.label.text = text;
    //    hud.labelText = text;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 设置背景
    hud.backgroundColor = [UIColor clearColor];
    // 消失时间
    //    [hud hideAnimated:YES afterDelay:time];
    [hud hideAnimated:YES afterDelay:time];
    return hud;
}

+ (MBProgressHUD *)show:(NSString *)text andTime:(NSTimeInterval)time
{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    // 初始化 MBProgressHUD
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 设置hud文字
    //    hud.label.text = text;
    //    hud.labelText = text;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 设置背景
    hud.backgroundColor = [UIColor clearColor];
    // 消失时间
    //    [hud hideAnimated:YES afterDelay:time];
    [hud hideAnimated:YES afterDelay:time];
    return hud;
}

+ (UIWindow *)lastWindow
{
    //    NSArray *windows = [UIApplication sharedApplication].windows;
    //    for(UIWindow *window in [windows reverseObjectEnumerator]) {
    //
    //        if ([window isKindOfClass:[UIWindow class]] &&
    //            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
    //
    //            return window;
    //    }
    
    return [UIApplication sharedApplication].keyWindow;
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    
    UIView *view = [MYHUDTool lastWindow];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //    hud.label.text = message;
    //    hud.userInteractionEnabled= NO;
    hud. label.text = message;
    // YES代表需要蒙版效果
    hud.backgroundColor = [UIColor clearColor];
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

/** 普通文本提示框 */
+ (void)hudShowText:(NSString *)text
{
    [self showMessage:text];
}

/** 带图片提示框 */
+ (void)hudShowText:(NSString *)text andIcon:(NSString *)imageIcon andTime:(NSTimeInterval)time
{
    [self show:text icon:imageIcon andTime:time];
}

+ (void)hudShowText:(NSString *)text andTime:(NSTimeInterval)time
{
    [self show:text andTime:time];
}

+ (void)hideHUD
{
    UIView *view = [MYHUDTool lastWindow];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
