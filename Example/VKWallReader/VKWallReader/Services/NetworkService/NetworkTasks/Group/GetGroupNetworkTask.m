//
//  GetGroupNetworkTask.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetGroupNetworkTask.h"
#import "BaseNetworkTask_protected.h"
#import "SessionManagerHelper.h"

@implementation GetGroupNetworkTask

- (TaskCancellationToken *)runWithGroupId:(NSString *)gid callback:(void (^)(GroupNetworkModel *group, NSError *error))callback
{
    [self.parametersModel addParameter:@"group_id" value:gid];
    return [self run:^(id response, NSError *error) {
        callback(response, error);
    }];
}

- (NSURLSessionDataTask *)performRequest:(PerformRequestCallbackBlock)callback
{
    NSDictionary *parameters = [self.parametersModel generateParametersDictionary];
    return [self.sessionManager GET:kAPIMethod_getGroupById parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                callback(responseObject, nil, [(NSHTTPURLResponse *)task.response statusCode]);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                callback(nil, error, [(NSHTTPURLResponse *)task.response statusCode]);
            }];
}

- (void)parseResponse:(id)response callback:(ResultCallbackBlock)callback
{
    NSError *error = nil;
    GroupNetworkModel *model = [[GroupNetworkModel alloc] initWithDictionary:response error:&error];
    callback(model, error);
}

@end
