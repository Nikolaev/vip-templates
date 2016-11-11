//
//  GetGroupNetworkTask.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "BaseNetworkTask.h"
#import "GroupNetworkModel.h"

@interface GetGroupNetworkTask : BaseNetworkTask

- (TaskCancellationToken *)runWithGroupId:(NSString *)gid callback:(void (^)(GroupNetworkModel *group, NSError *error))callback;

@end
