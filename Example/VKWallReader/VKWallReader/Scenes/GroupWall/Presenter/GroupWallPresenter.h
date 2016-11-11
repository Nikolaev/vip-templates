//
//  GroupWallPresenter.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "GroupWallPresenterInput.h"
#import "GroupWallPresenterOutput.h"

@interface GroupWallPresenter : NSObject <GroupWallPresenterInput>

@property (weak, nonatomic) id<GroupWallPresenterOutput> output;

@end
