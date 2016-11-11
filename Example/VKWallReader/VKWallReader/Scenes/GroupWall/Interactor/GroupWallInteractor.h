//
//  GroupWallInteractor.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupWallInteractorInput.h"
#import "GroupWallInteractorOutput.h"

@class GroupWallRouter;

@interface GroupWallInteractor : NSObject <GroupWallInteractorInput>

@property (strong, nonatomic) id<GroupWallInteractorOutput> output;
@property (strong, nonatomic) GroupWallRouter *router;

@end
