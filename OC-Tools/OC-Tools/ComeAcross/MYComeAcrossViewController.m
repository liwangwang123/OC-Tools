//
//  MYComeAcrossViewController.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/16.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYComeAcrossViewController.h"
#import "MYHelper.h"

#define WIDTH_SCALE(a) roundf([UIScreen mainScreen].bounds.size.width / 375.f * a)
#define HEIGHT_SCALE(a) roundf([UIScreen mainScreen].bounds.size.width / 667.f * a)

@interface MYComeAcrossViewController ()


@end

@implementation MYComeAcrossViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBar.hidden = YES;
    
//    [self addData];
}

- (void)addData {
    [[NetWorkTool sharedTools] requestMethod:GET URL:OuYuList parameters:nil finish:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] integerValue] == 0) {
            /** 0是成功 */
            NSArray *data = responseObject[@"data"];
            for (NSDictionary *dic in data) {
                
            }
            
        }else{
            
        }
        NSLog(@"%@",responseObject);
    }];
}



@end
