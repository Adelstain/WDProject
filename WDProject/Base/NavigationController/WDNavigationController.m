//
//  WDNavigationController.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "WDNavigationController.h"

@interface WDNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation WDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置NavigationBar
    self.navigationBar.translucent = NO;
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.shadowImage = [UIImage new];

    // 设置navBar字体颜色、字体大小
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [dict setObject:[UIFont fontWithName:@"HelveticaNeue-Medium" size:20] forKey:NSFontAttributeName];
    self.navigationBar.titleTextAttributes = dict;

    // gesture
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}


#pragma mark - Delegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if(self.viewControllers && self.viewControllers.count>1) {
        return YES;
    }else {
        return NO;
    }
}



#pragma mark - Response Event
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    else {
        viewController.hidesBottomBarWhenPushed = NO;
    }

    [super pushViewController:viewController animated:animated];
}

@end
