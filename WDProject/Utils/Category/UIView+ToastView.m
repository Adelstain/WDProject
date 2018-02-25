//
//  UIView+ToastView.m
//
//
//  Created by fengweidong on 2018/1/24.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "UIView+ToastView.h"

@implementation UIView (ToastView)
/** HUBProgressView show方法 */
+ (void)showHUB:(UIView *)superView animation:(BOOL)animation {
    [MBProgressHUD showHUDAddedTo:superView animated:animation];
}
/** HUBProgressView hide方法 */
+ (void)hideHUB:(UIView *)superView animation:(BOOL)animation {
    [MBProgressHUD hideHUDForView:superView animated:animation];
}
/** 自定义HUBProgressView */
+ (void)showCustomDialogHUB:(UIView *)superView text:(NSString *)text imageName:(NSString *)imageName animation:(BOOL)animation {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:superView];
    [superView addSubview:HUD];

    // 设置会话框文字
    HUD.label.text = text;

    // 设置会话框模式
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];

    // 显示会话框
    [HUD showAnimated:animation whileExecutingBlock:^{
        sleep(3);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}
/** 自定义HUBProgressView */
+ (void)showCustomDialogHUB:(UIView *)superView text:(NSString *)text animation:(BOOL)animation {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:superView];
    [superView addSubview:HUD];

    // 设置会话框文字
    HUD.label.text = text;

    // 设置会话框模式
    HUD.mode = MBProgressHUDModeText;

    // 显示会话框
    [HUD showAnimated:animation whileExecutingBlock:^{
        sleep(3);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}
@end
