//
//  LBManyButtonView.h
//  Bird
//
//  Created by 王力 on 2019/11/23.
//  Copyright © 2019 王力. All rights reserved.
//
/*
 多个按钮水平排列,按钮下方有一个水平线跟着移动
 LBManyButtonView *buttonView = [[LBManyButtonView alloc] initWithFrame:CGRectMake(10, 100, 300, 45) titles:@[@"按钮", @"按钮1", @"按钮和"] btnHeight:40];
 [self.view addSubview:buttonView];
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LBManyButtonViewDelegate <NSObject>

- (void)manyButtonAction:(UIButton *)sender index:(NSUInteger)index;

@end
@interface LBManyButtonView : UIView

@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, weak) id<LBManyButtonViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles btnHeight:(CGFloat)btnHeight;

@end

NS_ASSUME_NONNULL_END
