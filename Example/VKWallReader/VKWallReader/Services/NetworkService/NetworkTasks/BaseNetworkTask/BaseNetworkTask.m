//
//  BaseNetworkTask.m
//  ICNetworkHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import "BaseNetworkTask.h"
#import "BaseNetworkTask_protected.h"
#import "SessionManagerHelper.h"
#import "ErrorsHelper.h"

NSString *const kTokenRefreshedResult = @"kTokenRefreshedResult";
NSInteger const kErrorCodeTokenExpired = 401;

@interface BaseNetworkTask ()

@property (strong, nonatomic) NSURLSessionDataTask *dataTask;
@property (strong, nonatomic) TaskCancellationToken *cancellationToken;

@end

@implementation BaseNetworkTask


- (instancetype)init {
    self = [super init];
    if (self) {
        _sessionManager = [SessionManagerHelper sessionManager];
        
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.parametersModel = [NetworkTaskParametersModel new];
    __weak typeof(self) weakSelf = self;
    self.cancellationToken = [[TaskCancellationToken alloc] initWithCancelBlock:^{
        if (weakSelf.dataTask != nil) {
            [weakSelf.dataTask cancel];
        }
    }];
}

#pragma mark - protected

- (NSURLSessionDataTask *)performRequest:(PerformRequestCallbackBlock)callback
{
    callback(@(1), nil, 0);
    return nil;
}

- (void)parseResponse:(id)response callback:(ResultCallbackBlock)callback
{
    callback(nil, nil);
}

#pragma mark - bolts tasks

- (BFTask *)bf_validateParameters
{
    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
    NSError *error = [self.parametersModel validate];
    if (error == nil) {
        [completionSource setResult:nil];
    } else {
        [completionSource setError:error];
    }
    return completionSource.task;
}

- (BFTask *)bf_performRequest
{
    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
    self.dataTask = [self performRequest:^(id response, NSError *error, NSInteger statusCode) {
        if (error == nil) {
            [completionSource setResult:response];
        } else {
            [completionSource setError:error];
        }
    }];
    return completionSource.task;
}

- (BFTask *)bf_parseResponse:(BFTask *)task
{
    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
    [self parseResponse:task.result callback:^(id response, NSError *error) {
        if (error == nil) {
            [completionSource setResult:response];
        } else {
            [completionSource setError:error];
        }
    }];
    return completionSource.task;
}

- (BFTask *)checkIfTaskWasCanceled:(BFTask *)task
{
    if (self.cancellationToken.isCancelled) {
        return [BFTask cancelledTask];
    }
    if (task.error.code == -999) { //NSURLSessionDataTask was cancelled
        return [BFTask cancelledTask];
    }
    return nil;
}

#pragma mark - run methods

- (TaskCancellationToken *)run:(ResultCallbackBlock)finishBlock
{
    [[[[[[[[self prepareAsync] continueWithBlock:^id _Nullable(BFTask * _Nonnull task) {
        //validate parameters
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        return [self bf_validateParameters];
    }] continueWithBlock:^id(BFTask *task) {
        // check token and refresh if needed
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        return [self refreshTokenIfNeed];
    }] continueWithBlock:^id(BFTask *task) {
        //perform request
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        if (task.error) {
            return task;
        }
        return [self bf_performRequest];
    }] continueWithBlock:^id(BFTask *task) {
        //if response was failed becouse of expired token - refresh token
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        if (task.error) {
            if (task.error.code == kErrorCodeTokenExpired) {
                return [self refreshToken];
            } else {
                return task;
            }
        }
        return task;
    }] continueWithBlock:^id _Nullable(BFTask * _Nonnull task) {
        //if token was refreshed - repeat request
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        if (task.error) {
            return task;
        }
        NSString *result = task.result;
        if ([result isKindOfClass:[NSString class]] && [result isEqualToString:kTokenRefreshedResult]) {
            return [self bf_performRequest];
        }
        return task;
    }] continueWithBlock:^id _Nullable(BFTask * _Nonnull task) {
        //parse response
        BFTask *errTask = [self checkIfTaskWasCanceled:task];
        if (errTask != nil) {
            return errTask;
        }
        if (task.error) {
            return task;
        }
        return [self bf_parseResponse:task];
    }] continueWithBlock:^id _Nullable(BFTask * _Nonnull task) {
        //check result
        if (!self.cancellationToken.isCancelled || (self.cancellationToken.isCancelled && self.cancellationToken.performCallbackIfCanceled)) {
            dispatch_async(dispatch_get_main_queue(), ^{
                finishBlock(task.result, task.error);
            });
        }
        return nil;
    }];
    return self.cancellationToken;
}

#pragma mark - token handling tasks

- (BFTask *)refreshTokenIfNeed
{
    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
    [completionSource setResult:nil];
    BFTask *result = completionSource.task;
    return result;
    
//    BFTask *result = nil;
//    BOOL hasValidToken = self.useAccessToken ? [AuthManager sharedInstance].hasValidToken : YES;
//    if (hasValidToken) {
//        BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
//        [completionSource setResult:nil];
//        result = completionSource.task;
//    } else if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateBackground) {
//        result = [self refreshToken];
//    } else {
//        BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
//        [completionSource setResult:nil];
//        result = completionSource.task;
//    }
//    return result;
}

- (BFTask *)refreshToken
{
    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
    [completionSource setResult:nil];
    BFTask *result = completionSource.task;
    return result;
    
//    BFTaskCompletionSource *completionSource = [BFTaskCompletionSource taskCompletionSource];
//    [[AuthManager sharedInstance] refreshTokenWithCallback:^(NSError *error) {
//        if (error == nil) {
//            [completionSource setResult:kTokenRefreshedResult];
//        } else {
//            [completionSource setError:error];
//        }
//    }];
//    return completionSource.task;
}

#pragma mark - utils

- (BFTask *)prepareAsync
{
    BFTaskCompletionSource *taskSource = [BFTaskCompletionSource taskCompletionSource];
    dispatch_queue_t dqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dqueue, ^{
        [taskSource setResult:@"Async"];
    });
    return taskSource.task;
}

@end
