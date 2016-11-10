//
//  MainRouter.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import "MainRouter.h"
#import "GroupWallAssembly.h"
@import UIKit;

@implementation MainRouter

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

- (void)presentWallOfGroupWithID:(NSString *)groupId
{
    GroupWallInputData *data = [GroupWallInputData new];
    data.groupId = groupId;
    UIViewController *vc = [GroupWallAssembly assemblyWithInputData:data];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Private -

@end
