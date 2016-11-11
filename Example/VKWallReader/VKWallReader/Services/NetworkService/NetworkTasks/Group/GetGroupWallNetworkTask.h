//
//  GetGroupWallNetworkTask.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "BaseNetworkTask.h"
#import "WallNetworkModel.h"

@interface GetGroupWallNetworkTask : BaseNetworkTask

- (TaskCancellationToken *)runWithGroupId:(NSString *)gid
                                   offset:(NSUInteger)offset
                                    count:(NSUInteger)count
                                 callback:(void (^)(WallNetworkModel *wall, NSError *error))callback;

@end
