//
//  MYLoginViewController.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/16.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYLoginViewController.h"
#import "MYHelper.h"

@interface MYLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end

@implementation MYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.phoneTextField addTarget:self action:@selector(textFieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)hideKeyboard {
    [self.phoneTextField resignFirstResponder];
}

- (void)textFieldTextDidChange:(UITextField *)field {
    if (field.text.length > 0) {
        self.sureBtn.backgroundColor = [UIColor colorWithHexString:@"#31DCF0"];
        self.sureBtn.userInteractionEnabled = YES;
    } else {
        self.sureBtn.backgroundColor = [UIColor colorWithHexString:@"#BCBBBB"];
        self.sureBtn.userInteractionEnabled = NO;
    }
}

- (IBAction)sureAction:(UIButton *)sender {
    // 手机号验证
    if (self.phoneTextField.text != nil && self.phoneTextField.text.length > 0) {
        BOOL result = [MYHelper validateContactNumber:self.phoneTextField.text];
        if (result) {
            NSDictionary *dic = @{@"phone" : self.phoneTextField.text};
            [[NetWorkTool sharedTools] requestMethod:GET URL:Verification_Code parameters:dic finish:^(id responseObject, NSError *error) {
                if ([responseObject[@"code"] integerValue] == 0) {
                    /** 0是成功 */
                    
                }else{

                }
                NSLog(@"%@",responseObject);
            }];
        } else {
            
        }
    } else {
        
    }
}

- (IBAction)qqAction:(UIButton *)sender {
    NSLog(@"qq 登录");
}

- (IBAction)weixinAction:(UIButton *)sender {
    NSLog(@"weixin 登录");
}


@end
