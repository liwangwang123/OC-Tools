//
//  MYHelper.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/17.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYHelper.h"

@implementation MYHelper

+ (CAShapeLayer *)topLeftAndRightCorner:(UIView *)currentView {
    CGFloat radius = 20; // 圆角大小
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerTopRight; // 圆角位置，全部位置
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:currentView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = currentView.bounds;
    maskLayer.path = path.CGPath;
    return maskLayer;
}

+ (UIButton *)getCircleHeaderWithColor:(UIColor *)color shadowColor:(UIColor *)shadowColor frame:(CGRect)frame{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    CGFloat width = frame.size.width;
    btn.backgroundColor = color;
    [btn setTitle:@"哈哈哈哈" forState:UIControlStateNormal];
    btn.layer.cornerRadius = width / 2.f;
    btn.layer.masksToBounds = YES;
    return btn;
}

/**
 验证码手机号
 
 @param mobileNum 手机号
 @return YES 通过 NO 不通过
 */
+ (BOOL)validateContactNumber:(NSString *)mobileNum
{
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 16[6], 17[5, 6, 7, 8], 18[0-9], 170[0-9], 19[89]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705,198
     * 联通号段: 130,131,132,155,156,185,186,145,175,176,1709,166
     * 电信号段: 133,153,180,181,189,177,1700,199
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|6[6]|7[05-8]|8[0-9]|9[89])\\d{8}$";
    
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478]|9[8])\\d{8}$)|(^1705\\d{7}$)";
    
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|66|7[56]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    
    NSString *CT = @"(^1(33|53|77|8[019]|99)\\d{8}$)|(^1700\\d{7}$)";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)
       || ([regextestcm evaluateWithObject:mobileNum] == YES)
       || ([regextestct evaluateWithObject:mobileNum] == YES)
       || ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}

+ (UIViewController *)intoApp {
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    MYQuickChatViewController * VC01 = [self quickChatViewController];
    [self setUpTabbarController:tabbarVC subVC:VC01 title:@"速聊" itemImages:@[@"suliao_xuanzhong_select", @"suliao_xuanzhong_select"]];
    
    MYComeAcrossViewController * VC02 = [self comeAcrossViewController];
    [self setUpTabbarController:tabbarVC subVC:VC02 title:@"偶遇" itemImages:@[@"ouyu_weixuanzhong", @"ouyu_weixuanzhong_select"]];
    
    MYMessageViewController * VC03 = [self messageViewController];
    [self setUpTabbarController:tabbarVC subVC:VC03 title:@"消息" itemImages:@[@"xiaoxi_weixuanzhong", @"xiaoxi_weixuanzhong_select"]];
    
    MYMineViewController * VC04 = [self mineViewController];
    [self setUpTabbarController:tabbarVC subVC:VC04 title:@"我的" itemImages:@[@"wode_weixuanzhong", @"xiaoxi_xuanzhong_select"]];
    return tabbarVC;
}

+ (void )setUpTabbarController:(UITabBarController *)tabbarController subVC:(UIViewController *)subVC title:(NSString *)title itemImages:(NSArray<NSString *>*)itemImages {
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed:itemImages[0]];
    subVC.tabBarItem.selectedImage = [UIImage imageNamed:itemImages[1]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:subVC];
    [tabbarController addChildViewController:nav];
}

+ (UIViewController *)loginAction {
    MYLoginViewController *login = [[MYLoginViewController alloc] initWithNibName:@"MYLoginViewController" bundle:nil];
    UINavigationController *loginNV = [[UINavigationController alloc] initWithRootViewController:login];
    return loginNV;
}

+ (MYQuickChatViewController *)quickChatViewController {
    MYQuickChatViewController *quickChat = [[MYQuickChatViewController alloc] init];
    return quickChat;
}

+ (MYComeAcrossViewController *)comeAcrossViewController {
    MYComeAcrossViewController *comeAcross = [[MYComeAcrossViewController alloc] init];
    return comeAcross;
}

+ (MYMessageViewController *)messageViewController {
    MYMessageViewController *message = [[MYMessageViewController alloc] init];
    return message;
}

+ (MYMineViewController *)mineViewController {
    MYMineViewController *mine = [[MYMineViewController alloc] init];
    return mine;
}

// APP定制按钮
+ (UIButton *)customMainButtonFrame:(CGRect)frame
                              title:(NSString *)title {
    UIButton *btn = [self customButtonFrame:frame
                                      title:title
                                 titleColor:[UIColor whiteColor]
                            backgroundColor:[UIColor blueColor]
                                       font:[UIFont systemFontOfSize:17]
                               cornerRadius:15];
    return btn;
}

// 初始化按钮
+ (UIButton *)customButtonFrame:(CGRect)frame
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                backgroundColor:(UIColor *)backgroundColor
                           font:(UIFont *)font
                   cornerRadius:(CGFloat)cornerRadius {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = backgroundColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = YES;
    return btn;
}



@end