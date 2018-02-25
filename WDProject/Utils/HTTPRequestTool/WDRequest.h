//
//  WDRequest.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDRequest : NSObject
@property (strong, nonatomic) NSString *requsetId;
@property (strong, nonatomic) NSDictionary *requestParamDic;// 请求参数
@property (weak, nonatomic) id callBackDelegate;
@end
