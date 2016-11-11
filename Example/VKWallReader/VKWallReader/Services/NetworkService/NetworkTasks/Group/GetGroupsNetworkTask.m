//
//  GetGroupsNetworkTask.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetGroupsNetworkTask.h"
#import "BaseNetworkTask_protected.h"
#import "SessionManagerHelper.h"

@implementation GetGroupsNetworkTask

- (TaskCancellationToken *)runWithGroupIds:(NSArray<NSString *>*)uids callback:(void (^)(NSArray<GroupNetworkModel *> *groups, NSError *error))callback
{
    [self.parametersModel addParameter:@"group_ids" value:uids];
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
    if ([response isKindOfClass:[NSArray class]]) {
        NSArray<NSDictionary *> *groupsRaw = response;
        NSMutableArray<GroupNetworkModel*> *groups = [NSMutableArray array];
        [groupsRaw enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSError *parseError = nil;
            GroupNetworkModel *model = [[GroupNetworkModel alloc] initWithDictionary:obj error:&parseError];
            if (parseError == nil) {
                [groups addObject:model];
            }
        }];
        callback(groups, error);
    } else {
        callback(nil, error);
    }
   
}

@end
