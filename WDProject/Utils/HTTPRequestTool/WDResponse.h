//
//  WDResponse.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDResponse : NSObject
@property (strong, nonatomic) NSString *requestId;
@property (strong, nonatomic) NSDictionary *responseData;
@property (weak, nonatomic) id callBackDelegate;
@end
