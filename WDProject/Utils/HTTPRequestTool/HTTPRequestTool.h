//
//  HTTPRequestTool.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "WDResponse.h"
#import "WDRequest.h"

@protocol HTTPRequestToolDelegate <NSObject>
@optional
- (void)transactionFinished:(WDResponse *)response;
- (void)transactionFailed:(WDResponse *)response;

@end


@interface HTTPRequestTool : NSObject
+(instancetype)shareHTTPRequestTool;
-(void)addDelegate:(id<HTTPRequestToolDelegate>)delegate;
-(void)removeDelegate:(id<HTTPRequestToolDelegate>)delegate;

#pragma mark - public method
- (void)getWithWSRequest:(WDRequest *)wxRequest;

@end
