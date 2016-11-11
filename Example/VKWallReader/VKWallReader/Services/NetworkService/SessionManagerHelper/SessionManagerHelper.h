//
//  SessionManagerHelper.h
//  SessionManagerHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface SessionManagerHelper : NSObject

+ (void)setBaseURL:(NSString *)baseURL;
+ (NSString *)baseURL;

+ (AFHTTPSessionManager *)sessionManager;

@end
