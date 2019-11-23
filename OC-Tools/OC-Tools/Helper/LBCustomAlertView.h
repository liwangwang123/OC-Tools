//
//  LBCustomAlertView.h
//  Bird
//
//  Created by 王力 on 2019/11/23.
//  Copyright © 2019 王力. All rights reserved.
//
/*
 带q取消与确定的弹出框
 LBCustomAlertView *alert = [[LBCustomAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds titles:@[@"清空记录", @"是否清空全部历史记录？"]];
 [alert showCustomAlert];
 alert.alertAction = ^(UIButton * sender, NSInteger index) {
     NSLog(@"%@--%ld", sender, index);
 };
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CustomAlertAction)(UIButton *, NSInteger);

@interface LBCustomAlertView : UIView

@property (nonatomic, copy) CustomAlertAction alertAction;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
- (void)showCustomAlert;
@end

NS_ASSUME_NONNULL_END
