//
//  GetGroupWallNetworkTask.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetGroupWallNetworkTask.h"
#import "BaseNetworkTask_protected.h"
#import "SessionManagerHelper.h"

@implementation GetGroupWallNetworkTask

- (TaskCancellationToken *)runWithGroupId:(NSString *)gid
                                   offset:(NSUInteger)offset
                                    count:(NSUInteger)count
                                 callback:(void (^)(WallNetworkModel *wall, NSError *error))callback
{
    [self.parametersModel addParameter:@"owner_id" value:gid];
    [self.parametersModel addParameter:@"offset" value:@(offset)];
    [self.parametersModel addParameter:@"count" value:@(count)];
    [self.parametersModel addParameter:@"extended" value:@(1)];
    return [self run:^(id response, NSError *error) {
        callback(response, error);
    }];
}

- (NSURLSessionDataTask *)performRequest:(PerformRequestCallbackBlock)callback
{
    NSDictionary *parameters = [self.parametersModel generateParametersDictionary];
    return [self.sessionManager GET:kAPIMethod_getGroupWall parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
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
    WallNetworkModel *model = [[WallNetworkModel alloc] initWithDictionary:response error:&error];
    callback(model, error);
}


@end
