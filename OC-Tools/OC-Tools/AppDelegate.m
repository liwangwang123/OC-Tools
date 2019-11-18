//
//  AppDelegate.m
//  OC-Tools
//
//  Created by 王力 on 2019/11/18.
//  Copyright © 2019 王力. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [UITabBar appearance].translucent = NO;
//    if (@available(iOS 13.0, *)) {
//        [self.window setOverrideUserInterfaceStyle:UIUserInterfaceStyleLight]; // 强制设置为light模式
//    }
    
    
    
    self.window.rootViewController = [MYHelper intoApp];
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end
