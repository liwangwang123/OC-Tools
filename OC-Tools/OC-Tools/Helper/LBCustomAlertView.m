//
//  LBCustomAlertView.m
//  Bird
//
//  Created by 王力 on 2019/11/23.
//  Copyright © 2019 王力. All rights reserved.
//

#import "LBCustomAlertView.h"

@implementation LBCustomAlertView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideCuetomAlert)];
        [self addGestureRecognizer:tap];
        [self addSubButtons:titles];
    }
    return self;
}
// 屏幕旋转更新布局
- (void)layoutSubviews {
    [super layoutSubviews];
    //1.获取到屏幕旋转的方向
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    //2.根据屏幕旋转方向布局子视图
    switch (orientation) {
            //竖直方向
        case UIDeviceOrientationPortrait: {
            CGRect fram = self.frame;
            fram = [UIScreen mainScreen].bounds;
            self.frame = fram;
        }
            //倒立
        case UIDeviceOrientationPortraitUpsideDown:
            break;
            
            //右横屏
        case UIDeviceOrientationLandscapeRight: {
            CGRect fram = self.frame;
            fram = [UIScreen mainScreen].bounds;
            self.frame = fram;
        }
            //左横屏
        case UIDeviceOrientationLandscapeLeft: {
            CGRect fram = self.frame;
            fram = [UIScreen mainScreen].bounds;
            self.frame = fram;
        }
            break;
            
        default:
            break;
    }
}

- (void)hideCuetomAlert {
    [self removeFromSuperview];
}

- (void)showCustomAlert {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)addSubButtons:(NSArray *)titles {
    CGFloat left = 30;
    CGFloat width = kScreenWidth - left * 2;
    CGFloat height = 10;
    UIView *view = [MYHelper customViewFrame:CGRectMake(left, self.center.y - 100, width, 145) corRadiu:5];
    view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin;
    [self addSubview:view];
    UILabel *titleLabel = [MYHelper customLabelFrame:CGRectMake(0, height, width, 48) title:titles[0] titleColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:18]];
    height = height + 48;
    UILabel *messageLabel = [MYHelper customLabelFrame:CGRectMake(0, height, width, 15) title:titles[1] titleColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15]];
    height = height + 15;
    [view addSubview:titleLabel];
    [view addSubview:messageLabel];
    height = height + 22;
    UIView *line1 = [MYHelper customViewFrame:CGRectMake(0, height, width, 1) corRadiu:5];
    line1.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:line1];
    height = height + 1;
    UIButton *cancelBtn = [MYHelper customButtonFrame:CGRectMake(0, height, width / 2 - 1, 145 - height) title:@"取消" titleColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:18] cornerRadius:0];
    [cancelBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.tag = 10000;
    [view addSubview:cancelBtn];
    UIView *line2 = [MYHelper customViewFrame:CGRectMake(width / 2 - 1, height, 1, 145 - height) corRadiu:5];
    line2.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:line2];
    UIButton *sureBtn = [MYHelper customButtonFrame:CGRectMake(width / 2 + 1, height, width / 2 - 1, 145 - height) title:@"确定" titleColor:[UIColor greenColor] backgroundColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:18] cornerRadius:0];
    [sureBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.tag = 10001;
    [view addSubview:sureBtn];
    
    
}

- (void)buttonAction:(UIButton *)sender {
    NSInteger tag = sender.tag - 10000;
    self.alertAction(sender, tag);
    [self hideCuetomAlert];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
