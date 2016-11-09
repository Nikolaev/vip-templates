//
//  GetGroupsNetworkTask.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "BaseNetworkTask.h"
#import "GroupNetworkModel.h"

@interface GetGroupsNetworkTask : BaseNetworkTask

- (TaskCancellationToken *)runWithGroupIds:(NSArray<NSString *>*)uids callback:(void (^)(NSArray<GroupNetworkModel *> *groups, NSError *error))callback;

@end
