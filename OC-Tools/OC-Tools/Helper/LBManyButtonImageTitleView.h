//
//  LBManyButtonImageTitleView.h
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//
/*
 多个按钮水平排列,按钮同时有图片和标题, 数组里面前面是图片名称,后边是标题
 LBManyButtonImageTitleView *titleView = [[LBManyButtonImageTitleView alloc] initWithFrame:CGRectMake(10, 200, 300, 45) titles:@[@[@"评论", @"735"], @[@"收藏", @"735"], @[@"转发", @"收藏"], @[@"点赞", @"分享"]] manyButtonType:ManyButtonImageTitleTypeImageTop];
 titleView.delegate = self;
 [self.view addSubview:titleView];
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, ManyButtonImageTitleType){
    ManyButtonImageTitleTypeDefault, // 左图片,右文字
    ManyButtonImageTitleTypeImageTop, // 上图片,下文字
};

@protocol LBManyButtonImageTitleViewDelegate <NSObject>
@required
- (void)manyButtonAction:(UIButton *)sender index:(NSUInteger)index;

@end
@interface LBManyButtonImageTitleView : UIView
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, weak) id<LBManyButtonImageTitleViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles manyButtonType:(ManyButtonImageTitleType)manyButtonType;
@end

NS_ASSUME_NONNULL_END
