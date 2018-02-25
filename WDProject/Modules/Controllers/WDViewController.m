//
//  WDViewController.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "WDViewController.h"
#import "UIView+ToastView.h"
#import "HTTPRequestTool.h"
#import "CanadaTable.h"
#import "CanadaModel.h"

@interface WDViewController () <HTTPRequestToolDelegate>
@property (nonatomic, strong) CanadaTable *table;

@end

@implementation WDViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.table];

    // headerRefresh
    [self addRefreshHeader:self.table refreshAnimationType:MJRefreshAnimationTypeNone];
}


#pragma mark - Response Event
- (void)loadDataWithCurentPage:(NSInteger)currentPage {
    [UIView showHUB:self.view animation:YES];
    [[HTTPRequestTool shareHTTPRequestTool] addDelegate:self];
    WDRequest *request = [[WDRequest alloc] init];
//    NSDictionary *dicParams = @{@"":@""};
    request.requsetId = requestUrl;
//    request.requestParamDic = dicParams;
    request.callBackDelegate = self;
    [[HTTPRequestTool shareHTTPRequestTool] getWithWSRequest:request];
}


#pragma mark - Delegate
- (void)transactionFinished:(WDResponse *)response {
    if ([response.requestId isEqualToString:requestUrl]) {
        [[HTTPRequestTool shareHTTPRequestTool] removeDelegate:self];
        [UIView hideHUB:self.view animation:YES];
        [self endRefresh];

        NSLog(@"%@", response.responseData);

        // 解析数据
        if ([response.responseData objectForKey:@"title"] != nil) {
            self.title = [response.responseData objectForKey:@"title"];
        }
        if ([response.responseData objectForKey:@"rows"] != nil) {
            // 字典转模型
            NSMutableArray *dataSource = [NSMutableArray array];
            NSArray *arr = [response.responseData objectForKey:@"rows"];
            for (unsigned int i = 0; i < arr.count; i++) {
                CanadaModel *mode = [[CanadaModel alloc] initWithDictionary:arr[i]];
                if ((mode.title.length > 0) || (mode.imageHref.length > 0) || (mode.desc.length > 0)) {
                    [dataSource addObject:mode];
                }
            }
            // 刷新列表
            [self.table reloadDataOfTableViewWithDataSources:dataSource];
        }
    }
}
- (void)transactionFailed:(WDResponse *)response {
    [[HTTPRequestTool shareHTTPRequestTool] removeDelegate:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self endRefresh];
}


#pragma mark - lazy loding
- (CanadaTable *)table {
    if (!_table) {
        _table = [[CanadaTable alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight-kTopHeight) style:UITableViewStyleGrouped];
    }

    return _table;
}

@end
