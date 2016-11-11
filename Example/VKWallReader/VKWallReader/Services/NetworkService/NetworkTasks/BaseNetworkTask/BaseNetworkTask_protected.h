//
//  BaseNetworkTask_protected.h
//
//
//  Created by nikolaev on 30/03/16.
//  Copyright © 2016 All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "NetworkTaskParametersModel.h"
#import "NetworkTaskAPIMethods.h"
#import <Bolts/Bolts.h>
#import "ErrorsHelper.h"

typedef void (^PerformRequestCallbackBlock)(id response, NSError * error, NSInteger statusCode);

@interface BaseNetworkTask ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic) NetworkTaskParametersModel *parametersModel;

- (NSURLSessionDataTask *)performRequest:(PerformRequestCallbackBlock)callback;
- (void)parseResponse:(id)response callback:(ResultCallbackBlock)callback;

@end

