//
//  WDBaseListViewController.m
//  WDProject
//
//  Created by weidong on 2018/2/25.
//  Copyright © 2018年 ShangYing. All rights reserved.
//

#import "WDBaseListViewController.h"
#import "MJRefresh.h"

@interface WDBaseListViewController ()
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) MJRefreshBackNormalFooter *footer;
@property (nonatomic, weak) MJRefreshAutoGifFooter *gfooter;

@end

@implementation WDBaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 *  头部刷新headerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  头部刷新类型
 */
- (void)addRefreshHeader:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType {
    [self addRefreshHeader:scrollView refreshAnimationType:refreshAnimationType idleImages:nil pullImages:nil refreshingImages:nil];
}
/**
 *  头部刷新headerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  头部刷新类型
 *  @param idleImages   刷新动画的初始状态images
 *  @param pullImages   刷新动画的滑动状态images
 *  @param refreshingImages   刷新中状态的images
 */
- (void)addRefreshHeader:(UIScrollView *)scrollView  refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType idleImages:(NSArray *)idleImages pullImages:(NSArray *)pullImages refreshingImages:(NSArray *)refreshingImages {
    self.scrollView = scrollView;

    if (refreshAnimationType == MJRefreshAnimationTypeNone) {
        // 设置回调
        MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
        [header setRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        // 设置头部刷新文字
        [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
        [header setTitle:@"松手可刷新" forState:MJRefreshStatePulling];
        [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];

        // 设置头部刷新文案字体
        header.stateLabel.font = [UIFont systemFontOfSize:15];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];

        // 设置头部刷新文案颜色
        header.stateLabel.textColor = [UIColor grayColor];
        header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];

        // 自动刷新 - (已进入页面下拉刷新)
        [header beginRefreshing];

        // 设置头部刷新控件
        self.scrollView.mj_header = header;
    }
    else {
        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的headerRefresh方法）
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
        // 设置头部刷新文字
        [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
        [header setTitle:@"松手可刷新" forState:MJRefreshStatePulling];
        [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];

        // 设置头部刷新文案字体
        header.stateLabel.font = [UIFont systemFontOfSize:15];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];

        // 设置头部刷新文案颜色
        header.stateLabel.textColor = [UIColor grayColor];
        header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];

        // 设置普通状态的动画图片
        [header setImages:idleImages forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [header setImages:pullImages forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];

        // 自动刷新 - (已进入页面下拉刷新)
        [header beginRefreshing];

        // 设置头部刷新控件
        self.scrollView.mj_header = header;
    }
}
/**
 *  尾部刷新footerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  尾部刷新类型
 */
- (void)addRefreshFooter:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType{
    [self addRefreshFooter:scrollView refreshAnimationType:refreshAnimationType idleImages:nil pullImages:nil refreshingImages:nil];
}
/**
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  尾部刷新类型
 *  @param idleImages   刷新动画的初始状态images
 *  @param pullImages   刷新动画的滑动状态images
 *  @param refreshingImages   刷新中状态的images
 */
- (void)addRefreshFooter:(UIScrollView *)scrollView  refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType idleImages:(NSArray *)idleImages pullImages:(NSArray *)pullImages refreshingImages:(NSArray *)refreshingImages {
    self.scrollView = scrollView;

    if (refreshAnimationType == MJRefreshAnimationTypeNone) {
        // 设置回调
        MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
        [footer setRefreshingTarget:self refreshingAction:@selector(footerRefresh)];

        // 设置尾部刷新文案
        [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
        [footer setTitle:@"松手加载更多" forState:MJRefreshStatePulling];
        [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
        [footer setTitle:@"没有更多数据" forState:MJRefreshStateRefreshing];

        // 设置尾部刷新文案字体
        footer.stateLabel.font = [UIFont systemFontOfSize:15];

        // 设置尾部刷新文案字体颜色
        footer.stateLabel.textColor = [UIColor grayColor];

        // 全局footer
        self.footer = footer;

        // 设置尾部刷新
        self.scrollView.mj_footer = footer;
    }
    else {
        MJRefreshAutoGifFooter *gfooter = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];

        // 设置尾部刷新文案
        [gfooter setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
        [gfooter setTitle:@"松手加载更多" forState:MJRefreshStatePulling];
        [gfooter setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
        [gfooter setTitle:@"没有更多数据" forState:MJRefreshStateRefreshing];

        // 设置尾部刷新文案字体
        gfooter.stateLabel.font = [UIFont systemFontOfSize:15];

        // 设置尾部刷新文案字体颜色
        gfooter.stateLabel.textColor = [UIColor grayColor];

        // 设置普通状态的动画图片
        [gfooter setImages:idleImages forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [gfooter setImages:pullImages forState:MJRefreshStatePulling];
        // 设置刷新图片
        [gfooter setImages:refreshingImages forState:MJRefreshStateRefreshing];

        // 全局footer
        self.gfooter = gfooter;

        // 设置尾部
        self.scrollView.mj_footer = gfooter;
    }
}
/**
 *  结束刷新
 */
- (void)endRefresh {
    if (self.currentPage == 1) {
        [self.scrollView.mj_header endRefreshing];
    }
    else {
        [self.scrollView.mj_footer endRefreshing];
    }
}
/**
 *  已加载全部
 */
- (void)endRefreshingWithNoMoreData {
    if (self.footer) {
        [self.footer endRefreshingWithNoMoreData];
    }
    else {
        [self.gfooter endRefreshingWithNoMoreData];
    }
}
/**
 *  数据加载
 *  @param currentPage  页码
 */
- (void)loadDataWithCurentPage:(NSInteger)currentPage {

}

- (void)headerRefresh {
    self.currentPage = 1;
    [self loadDataWithCurentPage:self.currentPage];
}
- (void)footerRefresh {
    self.currentPage += 1;
    [self loadDataWithCurentPage:self.currentPage];
}

@end
