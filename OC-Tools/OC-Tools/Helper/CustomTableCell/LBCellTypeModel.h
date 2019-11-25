//
//  LBCellTypeModel.h
//  Bird
//
//  Created by 王力 on 2019/11/25.
//  Copyright © 2019 王力. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBCellTypeModel : NSObject
@property (nonatomic, copy) NSString *cellName;
@property (nonatomic, assign) TableViewCellType cellType;
@end

NS_ASSUME_NONNULL_END
