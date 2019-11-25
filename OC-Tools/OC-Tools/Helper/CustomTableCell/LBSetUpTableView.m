//
//  LBSetUpTableView.m
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//

#import "LBSetUpTableView.h"
#import "LBBaseCell.h"
#import "LBCellTypeModel.h"

@interface LBSetUpTableView () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation LBSetUpTableView

- (instancetype)initWithTableView:(TableViewDataModel *)dataModel viewController:(MainViewController *)viewController frame:(CGRect)frame {
    if (self = [super init]) {
        _dataModel = dataModel;
        _frame = frame;
        [viewController.view addSubview:self.tableView];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        for (LBCellTypeModel *cellTypeModel in dataModel.cellTypeModels) {
            if (cellTypeModel.cellType == TableViewCellTypeForCode) {
                [self.tableView registerClass:[NSClassFromString(cellTypeModel.cellName) class] forCellReuseIdentifier:cellTypeModel.cellName];
            } else {
                [self.tableView registerNib:[UINib nibWithNibName:cellTypeModel.cellName bundle:nil] forCellReuseIdentifier:cellTypeModel.cellName];
            }
            
        }
    }
    return self;
}

- (void)reloadData {
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:_frame style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray *lists = self.dataModel.modelList;
    LBBaseModel *model = self.dataModel.modelList[indexPath.row];
    LBBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellName forIndexPath:indexPath];
    cell.model = lists[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.modelList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(setUpTableView:didSelectRowAtIndexPath:)]) {
        [self.delegate setUpTableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

@end
