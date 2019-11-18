//
//  MainTableViewController.m
//  OC-Tools
//
//  Created by 王力 on 2019/11/18.
//  Copyright © 2019 王力. All rights reserved.
//

#import "MainTableViewController.h"
#import "UITableViewCellModel.h"

@interface MainTableViewController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)addTableView:(NSArray <UITableViewCellModel *>*)cellModels viewController:(UIViewController *)viewController {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    for (UITableViewCellModel *cellModel in cellModels) {
        if (cellModel.cellType == TableViewCellTypeForCode) {
            [self.tableView registerClass:[NSClassFromString(cellModel.cellName) class] forCellReuseIdentifier:cellModel.cellName];
        } else {
            [self.tableView registerNib:[UINib nibWithNibName:cellModel.cellName bundle:nil] forCellReuseIdentifier:cellModel.cellName];
        }
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - [self getNavigationBarHeight] - [self getTabbarHeight]) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



@end
