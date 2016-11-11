//
//  GroupWallPresenterInput.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@class WallPostModel;

@protocol GroupWallPresenterInput <NSObject>

- (void)presentNavigationTitle:(NSString *)title;
- (void)presentPosts:(NSArray<WallPostModel*> *)posts;

@end
