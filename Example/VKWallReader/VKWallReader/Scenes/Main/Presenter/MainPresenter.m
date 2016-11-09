//
//  MainPresenter.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import "MainPresenter.h"
#import "GroupModel.h"
#import "MainModels.h"

@implementation MainPresenter

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

#pragma mark -  MainPresenterInput -

- (void)presentGroups:(NSArray<GroupModel *> *)groupsModels
{
    NSMutableArray<MainGroupViewModel *> *vms = [NSMutableArray array];
    [groupsModels enumerateObjectsUsingBlock:^(GroupModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MainGroupViewModel *vm = [MainGroupViewModel new];
        vm.name = obj.name;
        vm.avatarURL = obj.photoURL;
        [vms addObject:vm];
    }];
    [self.output displayGroups:vms];
}

#pragma mark - Private -

@end
