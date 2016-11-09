//
//  UpdateGroupInfoWorker.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupModel.h"

@interface UpdateGroupInfoWorker : NSObject

- (void)updateGroupWithId:(NSString *)uid callback:(void (^)(GroupModel *group, NSError *error))callback;
- (void)updateGroupsWithIds:(NSArray<NSString *> *)uids callback:(void (^)(NSArray<GroupModel *> *groups, NSError *error))callback;

@end
