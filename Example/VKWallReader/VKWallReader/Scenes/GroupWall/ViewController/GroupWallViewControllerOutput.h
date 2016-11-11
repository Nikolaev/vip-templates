//
//  GroupWallViewControllerOutput.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol GroupWallViewControllerOutput <NSObject>

- (void)requestInitialSetup;
- (void)requestGroupIdUpdate:(NSString *)groupId;
- (void)requestFetchNextpage;
- (void)requestFetchFirstpage;

@end
