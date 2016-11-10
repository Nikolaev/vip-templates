//
//  GroupWallInput.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol GroupWallOutput;
@class GroupWallInputData;

@protocol GroupWallInput <NSObject>

- (void)setModuleOutput:(id<GroupWallOutput>)moduleOutput;
- (void)configureWithData:(GroupWallInputData *)inputData;

@end
