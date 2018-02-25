//
//  NSString+Common.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Common)
/**
 *  获取字串size
 *  @param string 字串
 *  @param font   字体大小
 *  @param maxSize 指定size
 */
+ (CGSize)getStringSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;

@end
