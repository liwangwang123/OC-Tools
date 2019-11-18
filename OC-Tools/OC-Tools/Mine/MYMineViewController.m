//
//  MYMineViewController.m
//  MoYu-1
//
//  Created by 王力 on 2019/10/16.
//  Copyright © 2019 com.qimuwang.www. All rights reserved.
//

#import "MYMineViewController.h"

#define MYMineListCellIdentifier @"UITableViewCell"

@interface MYMineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataLists;

@end

@implementation MYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的";
    
//    if (@available(iOS 11.0, *)) {
//        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    
//    [self addData];
//    [self.view addSubview:self.tableView];
}

- (void)addData {
    [[NetWorkTool sharedTools] requestMethod:GET URL:WalletQuery parameters:nil finish:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] integerValue] == 0) {
            /** 0是成功 */
            NSDictionary *data = responseObject[@"data"];
            NSString *walletBean = data[@"bean"];
            NSString *walletDrill = data[@"deill"];
            
        }
    }];
    
    [[NetWorkTool sharedTools] requestMethod:GET URL:PersonCenter parameters:nil finish:^(id responseObject, NSError *error) {
        if ([responseObject[@"code"] integerValue] == 0) {
            NSArray *data = responseObject[@"data"];
            NSDictionary *dic = data.firstObject;
            
        }
    }];
    
    NSArray *names = @[@[@"个人中心", @"申请入驻", @"活动中心"], @[@"意见反馈", @"关于我们", @"退出登录"]];
    NSArray *icons = @[@[@"gerenzhongxin", @"shenqingruzhu", @"huodongzhongxin"], @[@"yijianfankui", @"guanyuwomen", @"tuichu"]];
    for (int i = 0; i < names.count; i++) {
        NSMutableArray *list = [NSMutableArray array];
        NSArray *item1 = names[i];
        NSArray *item2 = icons[i];
        for (int j = 0; j < item1.count; j++) {
            
        }
        [self.dataLists addObject:list];
    }
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - [self getNavigationBarHeight] - [self getTabbarHeight]) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor blackColor];
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MYMineListCellIdentifier];
//        [_tableView registerNib:[UINib nibWithNibName:MYMineListCellIdentifier bundle:nil] forCellReuseIdentifier:MYMineListCellIdentifier];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray *list = self.dataLists[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MYMineListCellIdentifier forIndexPath:indexPath];
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 51;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *list = self.dataLists[section];
    return list.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataLists.count;
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
            
        default:
            break;
    }
    self.hidesBottomBarWhenPushed = NO;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = MAIN_COLOR;
    return view;
}

- (NSMutableArray *)dataLists {
    if (!_dataLists) {
        _dataLists = [NSMutableArray array];
    }
    return _dataLists;
}


@end
