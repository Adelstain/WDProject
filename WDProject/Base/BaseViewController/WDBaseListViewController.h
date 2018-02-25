//
//  WDBaseListViewController.h
//  WDProject
//
//  Created by weidong on 2018/2/25.
//  Copyright © 2018年 ShangYing. All rights reserved.
//

#import "WDBaseViewController.h"

typedef NS_ENUM(NSInteger, MJRefreshAnimationType) {
    MJRefreshAnimationTypeNone,
    MJRefreshAnimationTypeGif
};

@interface WDBaseListViewController : WDBaseViewController
@property (nonatomic, assign) NSInteger currentPage; // 请求的当前页码

/**
 *  头部刷新headerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  头部刷新类型
 */
- (void)addRefreshHeader:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType;
/**
 *  头部刷新headerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  头部刷新类型
 *  @param idleImages   刷新动画的初始状态images
 *  @param pullImages   刷新动画的滑动状态images
 *  @param refreshingImages   刷新中状态的images
 */
- (void)addRefreshHeader:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType idleImages:(NSArray *)idleImages pullImages:(NSArray *)pullImages refreshingImages:(NSArray *)refreshingImages;
/**
 *  尾部刷新footerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  尾部刷新类型
 */
- (void)addRefreshFooter:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType;
/**
 *  尾部刷新footerRefresh
 *  @param scrollView   刷新view
 *  @param refreshAnimationType  尾部刷新类型
 *  @param idleImages   刷新动画的初始状态images
 *  @param pullImages   刷新动画的滑动状态images
 *  @param refreshingImages   刷新中状态的images
 */
- (void)addRefreshFooter:(UIScrollView *)scrollView refreshAnimationType:(MJRefreshAnimationType)refreshAnimationType idleImages:(NSArray *)idleImages pullImages:(NSArray *)pullImages refreshingImages:(NSArray *)refreshingImages;
/**
 *  结束刷新
 */
- (void)endRefresh;
/**
 *  已加载全部
 */
- (void)endRefreshingWithNoMoreData;
/**
 *  数据加载
 *  @param currentPage  页码
 */
- (void)loadDataWithCurentPage:(NSInteger)currentPage;

@end
