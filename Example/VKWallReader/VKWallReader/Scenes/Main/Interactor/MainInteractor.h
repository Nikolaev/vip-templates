//
//  MainInteractor.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainInteractorInput.h"
#import "MainInteractorOutput.h"

@class MainRouter;

@interface MainInteractor : NSObject <MainInteractorInput>

@property (strong, nonatomic) id<MainInteractorOutput> output;
@property (strong, nonatomic) MainRouter *router;

@end
