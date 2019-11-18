//
//  MYMessageViewController.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/16.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYMessageViewController.h"
#import "MYHelper.h"

#define MYMessageListCellIdentifier @"UITableViewCell"
#define MYMessageContentListCellIdentifier @"UITableViewCell"

@interface MYMessageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataLists;

@end

@implementation MYMessageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    self.title = @"消息";
//    [self addRightBarButtonItemWithImage:[UIImage imageNamed:@"sousuo"]];
//    
//    [self addData];
//    [self.view addSubview:self.tableView];
}
- (void)addData {
    NSArray *icons = @[@"xitongxiaoxi", @"shipingguoderen", @"guanzhuderen", @"haoyouliebiao"];
    NSArray *names = @[@"系统消息", @"视频过的人", @"关注的人", @"好友列表"];
    NSArray *numbers = @[@"1", @"2", @"3", @"4"];
    NSMutableArray *list1 = [NSMutableArray array];
    for (int i = 0; i < icons.count; i++) {
        
    }
    [self.dataLists addObject:list1];
}


- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    self.hidesBottomBarWhenPushed = YES;
   
    self.hidesBottomBarWhenPushed = NO;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - [self getNavigationBarHeight] - [self getTabbarHeight]) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor blackColor];
//        [_tableView registerNib:[UINib nibWithNibName:MYMessageListCellIdentifier bundle:nil] forCellReuseIdentifier:MYMessageListCellIdentifier];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MYMessageContentListCellIdentifier];
//        [_tableView registerNib:[UINib nibWithNibName:MYMessageContentListCellIdentifier bundle:nil] forCellReuseIdentifier:MYMessageContentListCellIdentifier];
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray *list = self.dataLists[0];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MYMessageContentListCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.hidesBottomBarWhenPushed = YES;
    switch (indexPath.row) {
        case 0: {
            
        }
            break;
        case 1: {
            
        }
            break;
        case 2: {
            
        }
            break;
        case 3: {
            
        }
            break;
        default:
            break;
    }
    self.hidesBottomBarWhenPushed = NO;
    NSLog(@"点击");
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if ([cell respondsToSelector:@selector(tintColor)]) {
//
//        // if (tableView == self.tableView) {
//
//        CGFloat cornerRadius = 10.f;
//
//        cell.backgroundColor = UIColor.clearColor;
//
//        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//
//        CGMutablePathRef pathRef = CGPathCreateMutable();
//
//        CGRect bounds = CGRectInset(cell.bounds, 10, 0);
//
//        BOOL addLine = NO;
//
//        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//
//            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
//
//        } else if (indexPath.row == 0) {
//
//            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
//
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
//
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//
//            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
//
//            addLine = YES;
//
//        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
//
//            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
//
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
//
//            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
//
//            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
//
//        } else {
//
//            CGPathAddRect(pathRef, nil, bounds);
//
//            addLine = YES;
//
//        }
//
//        layer.path = pathRef;
//
//        CFRelease(pathRef);
//
//        //颜色修改
//
//        layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.5f].CGColor;
//
//        layer.strokeColor=[UIColor whiteColor].CGColor;
//
//        if (addLine == YES) {
//
//            CALayer *lineLayer = [[CALayer alloc] init];
//
//            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
//
//            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight);
//
//            lineLayer.backgroundColor = tableView.separatorColor.CGColor;
//
//            [layer addSublayer:lineLayer];
//
//        }
//
//        UIView *testView = [[UIView alloc] initWithFrame:bounds];
//
//        [testView.layer insertSublayer:layer atIndex:0];
//
//        testView.backgroundColor = UIColor.clearColor;
//
//        cell.backgroundView = testView;
//
//    }
//
//    // }
//
//}

- (NSMutableArray *)dataLists {
    if (!_dataLists) {
        _dataLists = [NSMutableArray array];
    }
    return _dataLists;
}

@end
