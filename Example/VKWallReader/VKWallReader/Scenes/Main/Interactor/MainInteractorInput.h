//
//  MainInteractorInput.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainInteractorInput <NSObject>

- (void)requestInitialSetup;
- (void)requestGroupsUpdate;
- (void)requestSelectGroupAtIndex:(NSUInteger)index;

@end
