//
//  GetWallOfGroupWorker.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetWallOfGroupWorker.h"
#import <MagicalRecord/MagicalRecord.h>
#import "ProfileEntity+Additions.h"
#import "GroupEntity+Additions.h"
#import "GetGroupWallNetworkTask.h"

@implementation GetWallOfGroupWorker

- (void)getWallOfGroup:(NSString *)groupID
                offset:(NSUInteger)offset
                 count:(NSUInteger)count
              callback:(void (^)(NSArray<WallPostModel *> *posts, NSError *error))callback
{
    GetGroupWallNetworkTask *task = [GetGroupWallNetworkTask new];
    [task runWithGroupId:groupID offset:offset count:count callback:^(WallNetworkModel *wall, NSError *error) {
        if (error != nil) {
            callback(nil, error);
            return;
        }
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            [wall.profiles enumerateObjectsUsingBlock:^(ProfileNetworkModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![obj isKindOfClass:[ProfileNetworkModel class]]) {
                    return;
                }
                ProfileEntity *profile = [ProfileEntity MR_findFirstOrCreateByAttribute:@"uid" withValue:obj.uid inContext:localContext];
                [profile updateWithModel:obj];
            }];
            [wall.groups enumerateObjectsUsingBlock:^(GroupNetworkModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                GroupEntity *group = [GroupEntity MR_findFirstOrCreateByAttribute:@"uid" withValue:obj.gid inContext:localContext];
                [group updateWithModel:obj];
            }];
        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
            if (callback != nil) {
                NSMutableArray<WallPostModel *> *posts = [NSMutableArray array];
                [wall.wall enumerateObjectsUsingBlock:^(WallPostNetworkModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    WallPostModel *model = [WallPostModel new];
                    model.uid = obj.uid;
                    model.text = obj.text;
                    model.photoURL = obj.photoURL;
                    model.photoWidth = obj.photoWidth;
                    model.photoHeight = obj.photoHeight;
                    model.posterID = obj.posterID;
                    if ([model.posterID containsString:@"-"]) {
                        NSString *guid = [model.posterID stringByReplacingOccurrencesOfString:@"-" withString:@""];
                        GroupEntity *group = [GroupEntity MR_findFirstByAttribute:@"uid" withValue:guid];
                        model.posterName = group.name;
                        model.posterAvatarURL = group.photoURL;
                    } else {
                        ProfileEntity *profile = [ProfileEntity MR_findFirstByAttribute:@"uid" withValue:model.posterID];
                        model.posterName = [NSString stringWithFormat:@"%@ %@", profile.firstName, profile.lastName];
                        model.posterAvatarURL = profile.avatarURL;
                    }
                    [posts addObject:model];
                }];
                callback(posts, nil);
            }
        }];
    }];
}

@end
