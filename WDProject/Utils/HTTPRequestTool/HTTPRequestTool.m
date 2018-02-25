//
//  HTTPRequestTool.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "HTTPRequestTool.h"
#import "NSJSONSerialization+Json.h"

@interface HTTPRequestTool ()
@property (nonatomic, strong) NSHashTable *delegates;

@end

@implementation HTTPRequestTool
+(instancetype)shareHTTPRequestTool {
    static HTTPRequestTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HTTPRequestTool alloc] init];
    });

    return tool;
}
- (id)init {
    if (self) {
        self.delegates = [[NSHashTable alloc] init];
    }

    return self;
}
-(void)addDelegate:(id<HTTPRequestToolDelegate>)delegate{
    @synchronized(self) {
        if (delegate && ![self.delegates containsObject:delegate]) {
            [self.delegates addObject:delegate];
        }
    }
}
-(void)removeDelegate:(id<HTTPRequestToolDelegate>)delegate {
    @synchronized(self) {
        if (delegate && [self.delegates containsObject:delegate]) {
            [self.delegates removeObject:delegate];
        }
    }
}



#pragma mark - public method
- (void)getWithWSRequest:(WDRequest *)wxRequest {
    // 初始化网络数据请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // 设置请求超时时间
    manager.requestSerializer.timeoutInterval = 10;
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 开始请求
    [manager GET:wxRequest.requsetId parameters:wxRequest.requestParamDic progress:^(NSProgress * _Nonnull uploadProgress) {
        // 数据请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        WDResponse *response = [[WDResponse alloc] init];
        response.responseData = [NSJSONSerialization returnObjectWithJsonStr:jsonStr];
        response.requestId = wxRequest.requsetId;
        response.callBackDelegate = wxRequest.callBackDelegate;
        if (jsonStr.length > 0) {
            if ([response.callBackDelegate respondsToSelector:@selector(transactionFinished:)]) {
                [response.callBackDelegate transactionFinished:response];
            }
        }
        else {
            if ([response.callBackDelegate respondsToSelector:@selector(transactionFailed:)]) {
                [response.callBackDelegate transactionFailed:response];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WDResponse *response = [[WDResponse alloc] init];
        response.requestId = wxRequest.requsetId;
        response.callBackDelegate = wxRequest.callBackDelegate;
        if ([response.callBackDelegate respondsToSelector:@selector(transactionFailed:)]) {
            [response.callBackDelegate transactionFailed:response];
        }
    }];
}

@end
