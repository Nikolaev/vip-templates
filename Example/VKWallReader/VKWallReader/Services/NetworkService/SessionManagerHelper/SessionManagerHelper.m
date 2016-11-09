//
//  SessionManagerHelper.m
//  SessionManagerHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import "SessionManagerHelper.h"
#import "MyRequestSerializer.h"
#import "MyResponseSerializer.h"
#import "AFNetworkActivityIndicatorManager.h"

static NSString *__baseURL;
static AFHTTPSessionManager *__sessionManager;

@interface SessionManagerHelper ()

@end

@implementation SessionManagerHelper

+ (void)setBaseURL:(NSString *)baseURL
{
    __baseURL = baseURL;
}

+ (NSString *)baseURL
{
    return __baseURL;
}


+ (AFHTTPSessionManager *)sessionManager
{
    if (__sessionManager == nil) {
        __sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:__baseURL]];
        AFHTTPRequestSerializer *reqSer = [MyRequestSerializer serializer];
        AFHTTPResponseSerializer *respSer = [MyResponseSerializer serializer];
        __sessionManager.requestSerializer = reqSer;
        __sessionManager.responseSerializer = respSer;
    }
    return __sessionManager;
}

@end
