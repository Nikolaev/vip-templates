//
//  BaseNetworkTask.h
//  ICNetworkHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskCancellationToken.h"

typedef void (^ResultCallbackBlock)(id response, NSError * error);

@class AFHTTPSessionManager;
@class AuthManager;

@interface BaseNetworkTask : NSObject

@property (readonly, nonatomic) TaskCancellationToken *cancellationToken;

//- (instancetype)initWithSessionManager:(AFHTTPSessionManager *)sessionManager authManager:(AuthManager *)authManager;
- (TaskCancellationToken *)run:(ResultCallbackBlock)finishBlock;

@end
