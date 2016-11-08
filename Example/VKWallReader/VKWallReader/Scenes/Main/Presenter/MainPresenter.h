//
//  MainPresenter.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MainPresenterInput.h"
#import "MainPresenterOutput.h"

@interface MainPresenter : NSObject <MainPresenterInput>

@property (weak, nonatomic) id<MainPresenterOutput> output;

@end
