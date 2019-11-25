//
//  LBSetUpTableView.h
//  Bird
//
//  Created by 王力 on 2019/11/24.
//  Copyright © 2019 王力. All rights reserved.
//
/*
 自定义tableView,table会根据model自动配置cell,目前支持一个分区,一个或多个cell,cell可以是xib或者纯代码
 NSMutableArray *array = [NSMutableArray array];
 for (int i = 0; i < 20; i++) {
     LBBase1Model *mo = [[LBBase1Model alloc] init];
     mo.name = [NSString stringWithFormat:@"姓名:%d", i];
     mo.cellName = @"LBBase1Cell";
     [array addObject:mo];
     
     LBBase1Model *mo1 = [[LBBase1Model alloc] init];
     mo1.name = [NSString stringWithFormat:@"姓名:%d", i];
     mo1.cellName = @"LBBase2Cell";
     [array addObject:mo1];
 }
 TableViewDataModel *model = [[TableViewDataModel alloc] init];
 LBCellTypeModel *cellTypeModel = [[LBCellTypeModel alloc] init];
 cellTypeModel.cellName = @"LBBase1Cell";
 cellTypeModel.cellType = TableViewCellTypeForCode;
 
 LBCellTypeModel *cellTypeModel1 = [[LBCellTypeModel alloc] init];
 cellTypeModel1.cellName = @"LBBase2Cell";
 cellTypeModel1.cellType = TableViewCellTypeForCode;
 
 model.cellTypeModels = @[cellTypeModel, cellTypeModel1];
 model.modelList = array;
 self.view.backgroundColor = [UIColor lightTextColor];
 self.tt = [[LBSetUpTableView alloc] initWithTableView:model viewController:self frame:self.view.bounds];
 self.tt.delegate = self;
 [self.tt reloadData];
 
 */

#import <Foundation/Foundation.h>
#import "TableViewDataModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol LBSetUpTableViewDelegate <NSObject>
@optional
- (void)setUpTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface LBSetUpTableView : NSObject
@property (nonatomic, strong) TableViewDataModel *dataModel;
@property (nonatomic, strong) MainViewController *viewController;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, weak) id<LBSetUpTableViewDelegate>delegate;
@property (nonatomic, strong) UITableView *tableView;
- (instancetype)initWithTableView:(TableViewDataModel *)dataModel viewController:(MainViewController *)viewController frame:(CGRect)frame;
- (void)reloadData;
@end

NS_ASSUME_NONNULL_END
