//
//  LBManyButtonImageTitleView.m
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//

#import "LBManyButtonImageTitleView.h"

@implementation LBManyButtonImageTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles manyButtonType:(ManyButtonImageTitleType)manyButtonType{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat height = frame.size.height;
        if (titles != nil || titles.count != 0) {
            NSUInteger number = titles.count;
            CGFloat width = frame.size.width / number;
            for (int i = 0; i < number; i++) {
                NSArray *title = titles[i];
                CGRect btnFrame = CGRectMake(width * i, 0, width , height);
                UIButton *btn = [self customMainButtonFrame:btnFrame title:title[1] imageName:title[0] manyButtonType:manyButtonType];
                btn.tag = 10000 + i;
                [self addSubview:btn];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    return self;
}

- (void)btnAction:(UIButton *)sender {
    NSInteger tag = sender.tag;
    if (self.delegate && [self.delegate respondsToSelector:@selector(manyButtonAction:index:)]) {
        [self.delegate manyButtonAction:sender index:tag - 10000];
    }
}

// APP定制按钮
- (UIButton *)customMainButtonFrame:(CGRect)frame
                              title:(NSString *)title imageName:(NSString *)imageName manyButtonType:(ManyButtonImageTitleType)manyButtonType{
    UIButton *btn = [MYHelper customButtonFrame:frame
                                      title:title
                                 titleColor:[UIColor blackColor]
                            backgroundColor:[UIColor whiteColor]
                                       font:[UIFont systemFontOfSize:17]
                               cornerRadius:0];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (manyButtonType == ManyButtonImageTitleTypeDefault) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 12);
    } else {
        float  spacing = 7;//图片和文字的上下间距
        CGSize imageSize = btn.imageView.frame.size;
        CGSize titleSize = btn.titleLabel.frame.size;
        CGSize textSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}];
        CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
        if (titleSize.width + 0.5 < frameSize.width) {
            titleSize.width = frameSize.width;
        }
        CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
        btn.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    }
    return btn;
}


@end
