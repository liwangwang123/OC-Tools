//
//  LBManyButtonView.m
//  Bird
//
//  Created by 王力 on 2019/11/23.
//  Copyright © 2019 王力. All rights reserved.
//

#import "LBManyButtonView.h"

@implementation LBManyButtonView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles btnHeight:(CGFloat)btnHeight {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        if (titles != nil || titles.count != 0) {
            NSUInteger number = titles.count;
            CGFloat width = frame.size.width / number;
//            CGFloat height = frame.size.height;
            for (int i = 0; i < number; i++) {
                CGRect btnFrame = CGRectMake(width * i, 0, width , btnHeight);
                UIButton *btn = [self customMainButtonFrame:btnFrame title:titles[i]];
                btn.tag = 10000 + i;
                [self addSubview:btn];
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                if (i == 0) {
                    [self addSubview:self.lineView];
                    CGPoint lineCenter = self.lineView.center;
                    lineCenter.x = btn.center.x;
                    self.lineView.center = lineCenter;
                }
            }
        }
    }
    return self;
}

- (void)btnAction:(UIButton *)sender {
    NSInteger tag = sender.tag;
    CGPoint lineCenter = self.lineView.center;
    lineCenter.x = sender.center.x;
    [UIView animateWithDuration:0.5 animations:^{    
        self.lineView.center = lineCenter;
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(manyButtonAction:index:)]) {
        [self.delegate manyButtonAction:sender index:tag - 10000];
    }
}

- (UIView *)lineView {
    if (!_lineView) {
        CGFloat lineHeight = 3;
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - lineHeight, 40, lineHeight)];
        _lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}

// APP定制按钮
- (UIButton *)customMainButtonFrame:(CGRect)frame
                              title:(NSString *)title {
    UIButton *btn = [MYHelper customButtonFrame:frame
                                      title:title
                                 titleColor:[UIColor blackColor]
                            backgroundColor:[UIColor whiteColor]
                                       font:[UIFont systemFontOfSize:17]
                               cornerRadius:0];
    return btn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
