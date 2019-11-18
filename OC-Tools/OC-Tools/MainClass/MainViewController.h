//
//  MYMainViewController.h
//  MoYu-1
//
//  Created by 王力 on 2019/10/17.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (nonatomic, strong) UILabel *noDataLabel;

- (void)addLeftBarButtonItemWithImage:(UIImage *)image;
- (void)addLeftBarButtonItemWithTitle:(NSString *)title;
- (void)leftBarButtonItemAction:(UIBarButtonItem *)item;

- (void)addRightBarButtonItemWithImage:(UIImage *)image;
- (void)addRightBarButtonItemWithTitle:(NSString *)title;
- (void)addCustomRightBarButtonTitle:(NSString *)title;
- (void)rightBarButtonItemAction:(UIBarButtonItem *)item;


- (CGFloat)getTabbarHeight;
- (CGFloat)getNavigationBarHeight;


@end

NS_ASSUME_NONNULL_END
