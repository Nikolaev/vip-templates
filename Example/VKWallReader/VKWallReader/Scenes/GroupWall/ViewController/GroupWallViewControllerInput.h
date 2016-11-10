//
//  GroupWallViewControllerInput.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@class WallPostViewModel;

@protocol GroupWallViewControllerInput <NSObject>

- (void)displayNavigationTitle:(NSString *)title;
- (void)displayPosts:(NSArray<WallPostViewModel *> *)posts;

@end
