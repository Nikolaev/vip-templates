//
//  MainViewControllerInput.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@class MainGroupViewModel;

@protocol MainViewControllerInput <NSObject>

- (void)displayGroups:(NSArray<MainGroupViewModel *> *)groupsViews;

@end
