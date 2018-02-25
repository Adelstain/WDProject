//
//  NSString+Common.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)
/** 获取字串size */
+ (CGSize)getStringSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading
                                    attributes:dic context:nil].size;
    
    return size;
}

@end
