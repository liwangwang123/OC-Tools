//
//  LBBaseModel.h
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//

#import "MainModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LBBaseModel : MainModel
@property (nonatomic, strong) NSString *cellName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) int age;

@end

NS_ASSUME_NONNULL_END
