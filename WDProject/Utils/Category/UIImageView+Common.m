//
//  UIImageView+Common.m
//
//
//  Created by fengweidong on 2018/1/24.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "UIImageView+Common.h"

@implementation UIImageView (Common)
+ (void)SD_setImageView:(UIImageView *)imageView url:(NSString *)url placeholderImage:(UIImage *)placeholderImage imageViewOptions:(SDWebImageOptions)webImageViewOptions {
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage options:webImageViewOptions];
    
}

@end
