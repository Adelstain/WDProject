//
//  UIImageView+Common.h
//  SYSP
//
//  Created by fengweidong on 2018/1/24.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Common)

+ (void)SD_setImageView:(UIImageView *)imageView url:(NSString *)url placeholderImage:(UIImage *)placeholderImage imageViewOptions:(SDWebImageOptions)webImageViewOptions;

@end
