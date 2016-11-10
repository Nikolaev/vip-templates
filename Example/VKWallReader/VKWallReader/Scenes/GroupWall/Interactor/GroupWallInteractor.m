//
//  GroupWallInteractor.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupWallInteractor.h"
#import "GroupWallRouter.h"
#import "GetGroupInfoWorker.h"
#import "GetWallOfGroupWorker.h"

@interface GroupWallInteractor ()

@property (strong, nonatomic) GroupModel *group;
@property (strong, nonatomic) NSMutableArray<WallPostModel *> *posts;
@property (assign, nonatomic) NSInteger paginationPageSize;

@end

@implementation GroupWallInteractor

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
    self.posts = [NSMutableArray array];
    self.paginationPageSize = 50;
}

- (void)dealloc
{

}

#pragma mark -  GroupWallInteractorInput -

- (void)requestGroupIdUpdate:(NSString *)groupId
{
    GetGroupInfoWorker *worker = [GetGroupInfoWorker new];
    self.group = [worker getGroupWithId:groupId];
}

- (void)requestInitialSetup
{
    [self.output presentNavigationTitle:self.group.name];
    [self requestFetchNextpage];
}

- (void)requestFetchNextpage
{
    //TODO: move pagination logic to separate worker
    GetWallOfGroupWorker *worker = [GetWallOfGroupWorker new];
    __weak typeof(self) wself = self;
    NSInteger offset = self.posts.count;
    [worker getWallOfGroup:self.group.uid offset:offset count:self.paginationPageSize callback:^(NSArray<WallPostModel *> *posts, NSError *error) {
        if (error != nil) {
            //TODO: handle error
            return ;
        }
        //TODO: handle "overlaps" and "gaps"
        [wself.posts addObjectsFromArray:posts];
        [wself.output presentPosts:wself.posts];
    }];
}

#pragma mark - Private -

@end
