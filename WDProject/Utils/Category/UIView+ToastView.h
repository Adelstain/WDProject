//
//  UIView+ToastView.h
//  
//
//  Created by fengweidong on 2018/1/24.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (ToastView)
/**
 *  HUBProgressView show方法
 *  @param superView 所在的父view
 *  @param animation 是否动画
 */
+ (void)showHUB:(UIView *)superView animation:(BOOL)animation;
/**
 *  HUBProgressView hide方法
 *  @param superView 所在的父view
 *  @param animation 是否动画
 */
+ (void)hideHUB:(UIView *)superView animation:(BOOL)animation;
/**
 *  自定义HUBProgressView
 *  @param superView 所在的父view
 *  @param text 会话框文字
 *  @param imageName 会话框图片
 *  @param animation 是否动画
 */
+ (void)showCustomDialogHUB:(UIView *)superView text:(NSString *)text imageName:(NSString *)imageName animation:(BOOL)animation;
/**
 *  自定义HUBProgressView
 *  @param superView 所在的父view
 *  @param text 会话框文字
 *  @param animation 是否动画
 */
+ (void)showCustomDialogHUB:(UIView *)superView text:(NSString *)text animation:(BOOL)animation;
@end
