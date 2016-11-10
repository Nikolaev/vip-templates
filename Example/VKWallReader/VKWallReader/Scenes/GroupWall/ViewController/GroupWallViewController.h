//
//  GroupWallViewController.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GroupWallInput.h"
#import "GroupWallViewControllerInput.h"
#import "GroupWallViewControllerOutput.h"

@interface GroupWallViewController : UIViewController <GroupWallInput, GroupWallViewControllerInput>

@property (strong, nonatomic) id<GroupWallViewControllerOutput> output;

@end
