//
//  UpdateGroupInfoWorker.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "UpdateGroupInfoWorker.h"
#import "GroupEntity+Additions.h"
#import <MagicalRecord/MagicalRecord.h>
#import "GetGroupNetworkTask.h"
#import "GetGroupsNetworkTask.h"

@implementation UpdateGroupInfoWorker

- (void)updateGroupWithId:(NSString *)uid callback:(void (^)(GroupModel *group, NSError *error))callback
{
    GetGroupNetworkTask *task = [GetGroupNetworkTask new];
    [task runWithGroupId:uid callback:^(GroupNetworkModel *group, NSError *error) {
        if (error != nil) {
            callback(nil, error);
            return;
        }
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            GroupEntity *groupData = [GroupEntity MR_findFirstOrCreateByAttribute:@"uid" withValue:uid inContext:localContext];
            [groupData updateWithModel:group];
        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
            if (callback != nil) {
                GroupEntity *groupData = [GroupEntity MR_findFirstByAttribute:@"uid" withValue:uid];
                GroupModel *groupModel = nil;
                if (groupData != nil) {
                    groupModel = [groupData plainObject];
                }
                callback(groupModel, nil);
            }
        }];
    }];
}

- (void)updateGroupsWithIds:(NSArray<NSString *> *)uids callback:(void (^)(NSArray<GroupModel *> *groups, NSError *error))callback
{
    GetGroupsNetworkTask *task = [GetGroupsNetworkTask new];
    [task runWithGroupIds:uids callback:^(NSArray<GroupNetworkModel *> *groups, NSError *error) {
        if (error != nil) {
            callback(nil, error);
            return;
        }
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            [groups enumerateObjectsUsingBlock:^(GroupNetworkModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                GroupEntity *groupData = [GroupEntity MR_findFirstOrCreateByAttribute:@"uid" withValue:obj.gid inContext:localContext];
                [groupData updateWithModel:obj];
            }];
        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
            if (callback != nil) {
                NSMutableArray<GroupModel *> *models = [NSMutableArray array];
                [groups enumerateObjectsUsingBlock:^(GroupNetworkModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    GroupEntity *groupData = [GroupEntity MR_findFirstByAttribute:@"uid" withValue:obj.gid];
                    GroupModel *groupModel = nil;
                    if (groupData != nil) {
                        groupModel = [groupData plainObject];
                        [models addObject:groupModel];
                    }
                }];
                callback(models, nil);
            }
        }];
    }];
}

@end
