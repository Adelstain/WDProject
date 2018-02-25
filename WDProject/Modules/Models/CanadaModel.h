//
//  CanadaModel.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CanadaModel : NSObject
/** imageHref */
@property (nonatomic, copy) NSString *imageHref;
/** title */
@property (nonatomic, copy) NSString *title;
/** description */
@property (nonatomic, copy) NSString *desc;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
