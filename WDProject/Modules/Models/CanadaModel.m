//
//  CanadaModel.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "CanadaModel.h"

@implementation CanadaModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        /** imageHref */
        self.imageHref = [dictionary objectForKey:@"imageHref"];
        /** title */
        self.title = [dictionary objectForKey:@"title"];
        /** description */
        self.desc = [dictionary objectForKey:@"description"];
    }

    return self;
}
@end
