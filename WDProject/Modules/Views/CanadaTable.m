//
//  CanadaTable.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "CanadaTable.h"
#import "CanadaModel.h"
#import "CanadaCell.h"

@interface CanadaTable () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSources;

@end

@implementation CanadaTable
static NSString *reuseIdentifier = @"CELL";

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[CanadaCell class] forCellReuseIdentifier:reuseIdentifier];
    }

    return self;
}


#pragma mark - Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] init];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footer = [[UIView alloc] init];
    return footer;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CanadaModel *mode = self.dataSources[indexPath.row];
    CGFloat CELLH = [NSString getStringSize:mode.desc font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(DeviceWidth-15-80-10-15, 0)].height+15+15+10+15;
    if (CELLH > 100) {
        return CELLH;
    }

    return 100.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CanadaCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 刷新列表数据
    [cell setMode:self.dataSources[indexPath.row]];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - Response Event
- (void)reloadDataOfTableViewWithDataSources:(NSMutableArray *)dataSources {
    self.dataSources = dataSources;
    [self reloadData];
}

@end
