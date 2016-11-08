//
//  MainViewController.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MainInput.h"
#import "MainViewControllerInput.h"
#import "MainViewControllerOutput.h"

@class MainRouter;

@interface MainViewController : UIViewController <MainInput, MainViewControllerInput>

@property (strong, nonatomic) id<MainViewControllerOutput> output;
@property (strong, nonatomic) MainRouter *router;

@end
