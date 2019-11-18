//
//  MYHUDTool.h
//  MoYu-1
//
//  Created by 王力 on 2019/10/24.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYHUDTool : NSObject
+ (void)hudShowText:(NSString *)text;

+ (void)hudShowText:(NSString *)text andIcon:(NSString *)imageIcon andTime:(NSTimeInterval)time;

+ (void)hudShowText:(NSString *)text andTime:(NSTimeInterval)time;

+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
