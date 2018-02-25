//
//  CanadaTable.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanadaTable : UITableView

/** 刷新列表 */
- (void)reloadDataOfTableViewWithDataSources:(NSMutableArray *)dataSources;

@end
