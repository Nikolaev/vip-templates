//
//  MainPresenterInput.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@class GroupModel;

@protocol MainPresenterInput <NSObject>

- (void)presentGroups:(NSArray<GroupModel *> *)groupsModels;

@end
