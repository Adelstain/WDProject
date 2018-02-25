//
//  UtilsMacros.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h


/**
 *  设备size、width、height
 */
#define DeviceSize         [UIScreen mainScreen].bounds.size
#define DeviceWidth        [UIScreen mainScreen].bounds.size.width
#define DeviceHeight       [UIScreen mainScreen].bounds.size.height

/**
 *  状态栏高度
 */
#define kStatusBarHeight   [[UIApplication sharedApplication] statusBarFrame].size.height
/**
 * 导航栏高度
 */
#define kNavBarHeight      44.0f
/**
 * 标签栏高度
 */
#define kTabBarHeight      (kStatusBarHeight > 20 ? 83.0f : 49.0f)
/**
 * 控制器顶部高度
 */
#define kTopHeight         (kStatusBarHeight + kNavBarHeight)


#endif /* UtilsMacros_h */
