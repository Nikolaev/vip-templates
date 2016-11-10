//
//  MainInteractor.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "MainInteractor.h"
#import "GetGroupInfoWorker.h"
#import "UpdateGroupInfoWorker.h"
#import "MainModels.h"
#import "MainRouter.h"

@interface MainInteractor ()

@property (strong, nonatomic) NSArray<GroupModel *> *groups;
@property (strong, nonatomic) NSArray<NSString *>* groupUIDS;

@end

@implementation MainInteractor

#pragma mark - Initialization -

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.groups = [NSArray array];
}

- (void)dealloc
{

}

#pragma mark -  MainInteractorInput -

- (void)requestInitialSetup
{
    self.groupUIDS = @[@"4240560", @"0", @"1", @"4", @"5", @"6", @"7"];
    [self groupsUpdated];
    [self requestGroupsUpdate];
}

- (void)requestGroupsUpdate
{
    [self updateGroups];
}

- (void)requestSelectGroupAtIndex:(NSUInteger)index
{
    GroupModel *group = self.groups[index];
    [self.router presentWallOfGroupWithID:group.uid];
}

#pragma mark - Private -

- (void)updateGroups
{
    UpdateGroupInfoWorker *updateWorker = [UpdateGroupInfoWorker new];
    __weak typeof(self) wself = self;
    [updateWorker updateGroupsWithIds:self.groupUIDS callback:^(NSArray<GroupModel *> *groups, NSError *error) {
        if (error == nil) {
            [wself groupsUpdated];
        } else {
            [wself groupsUpdated];
            //TODO: display error
        }
    }];
}

- (void)groupsUpdated
{
    GetGroupInfoWorker *getWorker = [GetGroupInfoWorker new];
    self.groups = [[getWorker groupsWithIDS:self.groupUIDS] mutableCopy];
    [self.output presentGroups:self.groups];
}

@end
