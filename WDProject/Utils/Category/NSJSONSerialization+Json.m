//
//  NSJSONSerialization+Json.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "NSJSONSerialization+Json.h"

@implementation NSJSONSerialization (Json)
+(id)returnObjectWithJsonStr:(NSString *)jsonStr {
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

    return object;
}

@end
