//
//  GetGroupInfoWorker.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetGroupInfoWorker.h"
#import "GetGroupNetworkTask.h"
#import "GroupEntity+Additions.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation GetGroupInfoWorker

- (GroupModel *)getGroupWithId:(NSString *)uid
{
    GroupEntity *groupData = [GroupEntity MR_findFirstByAttribute:@"uid" withValue:uid];
    GroupModel *group = nil;
    if (groupData != nil) {
        group = [groupData plainObject];
    }
    return group;
}

- (NSArray<GroupModel*>*)groupsWithIDS:(NSArray <NSString *>*)uids
{
    NSArray<GroupEntity *> *groups = [GroupEntity MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"uid IN %@", uids]];
    NSMutableArray *models = [NSMutableArray array];
    [groups enumerateObjectsUsingBlock:^(GroupEntity * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[obj plainObject]];
    }];
    return models;
}

@end
