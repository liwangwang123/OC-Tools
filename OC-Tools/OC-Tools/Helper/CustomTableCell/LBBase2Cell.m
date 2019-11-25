//
//  LBBase2Cell.m
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//

#import "LBBase2Cell.h"

@implementation LBBase2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor redColor];
}

- (void)setModel:(LBBase2Model *)model {
    self.textLabel.text = model.name;
    self.nameLabel.text = @"model.nam";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [MYHelper customLabelFrame:CGRectMake(self.frame.size.width - 100, 0, 100, self.frame.size.height) title:@"1" titleColor:[UIColor redColor] backgroundColor:[UIColor greenColor] font:[UIFont systemFontOfSize:17]];
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

@end
