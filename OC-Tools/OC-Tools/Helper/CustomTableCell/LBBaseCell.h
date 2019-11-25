//
//  LBBaseCell.h
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBBaseCell : UITableViewCell

@property (nonatomic, strong) LBBaseModel *model;

@end

NS_ASSUME_NONNULL_END
