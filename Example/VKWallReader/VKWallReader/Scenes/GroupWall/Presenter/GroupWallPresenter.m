//
//  GroupWallPresenter.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import "GroupWallPresenter.h"
#import "WallPostModel.h"
#import "GroupWallModels.h"

@interface GroupWallPresenter ()

@end

@implementation GroupWallPresenter

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

}

- (void)dealloc
{

}

#pragma mark -  GroupWallPresenterInput -

- (void)presentNavigationTitle:(NSString *)title
{
    [self.output displayNavigationTitle:title];
}

- (void)presentPosts:(NSArray<WallPostModel*> *)posts
{
    NSMutableArray<WallPostViewModel *> *vms = [NSMutableArray array];
    [posts enumerateObjectsUsingBlock:^(WallPostModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        WallPostViewModel *vm = [WallPostViewModel new];
        vm.userName = obj.posterName;
        vm.userAvatarURL = obj.posterAvatarURL;
        vm.text = obj.text;
        vm.photoURL = obj.photoURL;
        vm.photoWidth = obj.photoWidth;
        vm.photoHeight = obj.photoHeight;
        [vms addObject:vm];
    }];
    [self.output displayPosts:vms];
}

#pragma mark - Private -


@end
