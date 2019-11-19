//
//  MYHelper.h
//  MoYu-1
//
//  Created by 王力 on 2019/10/17.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MYQuickChatViewController.h"
#import "MYComeAcrossViewController.h"
#import "MYMessageViewController.h"
#import "MYMineViewController.h"
#import "MYLoginViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYHelper : NSObject

// 返回视图左上与右上圆角
+ (CAShapeLayer *)topLeftAndRightCorner:(UIView *)currentView;

+ (BOOL)validateContactNumber:(NSString *)mobileNum;
// 首页界面
+ (UIViewController *)intoApp;
// 登录界面
+ (UIViewController *)loginAction;
// 速聊
+ (MYQuickChatViewController *)quickChatViewController;
// 偶遇
+ (MYComeAcrossViewController *)comeAcrossViewController;
// 消息
+ (MYMessageViewController *)messageViewController;
// 我的
+ (MYMineViewController *)mineViewController;

// APP定制按钮
+ (UIButton *)customMainButtonFrame:(CGRect)frame
                              title:(NSString *)title;

// 初始化按钮
+ (UIButton *)customButtonFrame:(CGRect)frame
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                backgroundColor:(UIColor *)backgroundColor
                           font:(UIFont *)font
                   cornerRadius:(CGFloat)cornerRadius;

// 提示框
+ (UIAlertController *)alterView:(NSString *)message
                           style:(UIAlertControllerStyle)style
                    cancleButton:(NSString *)cancle
                    ensureButton:(NSArray *)ensureArr
                         handler:(void (^)(UIAlertAction *))handler
                            view:(UIViewController*)control;

// 提示框
+ (UIAlertController *)alterView:(NSString *)message
                   detailMessage:(NSString *)detailMessage
                           style:(UIAlertControllerStyle)style
                    cancleButton:(NSString *)cancle
                    ensureButton:(NSArray *)ensureArr
                         handler:(void (^)(UIAlertAction * _Nullable))handler
                            view:(UIViewController *)control;

@end

NS_ASSUME_NONNULL_END
