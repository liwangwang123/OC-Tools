//
//  MYObject.m
//  MoYu-1
//
//  Created by ylw on 2019/11/1.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setNilValueForKey:(NSString *)key {
    
}

@end
