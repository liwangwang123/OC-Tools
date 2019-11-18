//
//  MYMainViewController.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/17.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configure];
}

- (CGFloat)getTabbarHeight {
    return self.navigationController.tabBarController.tabBar.bounds.size.height;
}

- (CGFloat)getNavigationBarHeight {
    return self.navigationController.navigationBar.bounds.size.height;
}

- (void)configure {
//    [self.navigationController.navigationBar setBarTintColor:MAIN_COLOR];
    self.navigationController.navigationBar.translucent = NO;
//    [self.navigationController.navigationBar setTintColor:WHITE_COLOR];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: WHITE_COLOR};
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addLeftBarButtonItemWithImage:(UIImage *)image {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithImage:image
                             style:UIBarButtonItemStyleDone
                             target:self
                             action:@selector(leftBarButtonItemAction:)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    NSLog(@"left");
}
- (void)addLeftBarButtonItemWithTitle:(NSString *)title {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithTitle:title
                             style:UIBarButtonItemStyleDone
                             target:self
                             action:@selector(leftBarButtonItemAction:)];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)addRightBarButtonItemWithImage:(UIImage *)image {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithImage:image
                             style:UIBarButtonItemStyleDone
                             target:self
                             action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)addRightBarButtonItemWithTitle:(NSString *)title {
    UIBarButtonItem *item = [[UIBarButtonItem alloc]
                             initWithTitle:title
                             style:UIBarButtonItemStyleDone
                             target:self action:@selector(rightBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = item;
}


- (void)addCustomRightBarButtonTitle:(NSString *)title {
    UIButton *btn = [self addButtonTitleAndFont:[UIFont systemFontOfSize:15] title:title];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.action = @selector(rightBarButtonItemAction:);
    self.navigationItem.rightBarButtonItem = item;
}

- (UIButton *)addButtonTitleAndFont:(UIFont *)font title:(NSString *)title {
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame = CGRectMake(0, 0, 70, 28);
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    titleButton.layer.cornerRadius = 5;
    titleButton.layer.masksToBounds = YES;
    titleButton.titleLabel.font = font;
    titleButton.backgroundColor = WHITE_COLOR;
    return titleButton;
}
    
- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    NSLog(@"right");
}


- (void)dealloc {
    NSLog(@"控制器: %@ 被释放", [self class]);
}

- (UILabel *)noDataLabel {
    if (!_noDataLabel) {
        _noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
        _noDataLabel.text = @"亲, 您还没有数据哦~";
        _noDataLabel.center = self.view.center;
        _noDataLabel.textColor = [UIColor whiteColor];
        _noDataLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_noDataLabel];
    }
    return _noDataLabel;
}

@end
