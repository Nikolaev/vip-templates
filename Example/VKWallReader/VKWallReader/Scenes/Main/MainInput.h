//
//  MainInput.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol MainOutput;
@class MainInputData;

@protocol MainInput <NSObject>

- (void)setModuleOutput:(id<MainOutput>)moduleOutput;
- (void)configureWithData:(MainInputData *)inputData;

@end
