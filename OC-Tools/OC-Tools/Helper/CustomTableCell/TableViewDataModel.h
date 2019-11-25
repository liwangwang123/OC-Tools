//
//  UITableViewCellModel.h
//  OC-Tools
//
//  Created by 王力 on 2019/11/18.
//  Copyright © 2019 王力. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBBaseModel.h"
#import "LBCellTypeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewDataModel : NSObject
@property (nonatomic, strong) NSArray *cellTypeModels;
//@property (nonatomic, copy) NSString *cellName;
//@property (nonatomic, assign) TableViewCellType cellType;
@property (nonatomic, strong) NSArray <LBBaseModel *>*modelList;

@end

NS_ASSUME_NONNULL_END
