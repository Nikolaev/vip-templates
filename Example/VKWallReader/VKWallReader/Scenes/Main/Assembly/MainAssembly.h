//
//  MainAssembly.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MainInput.h"
#import "MainOutput.h"
#import "MainInputData.h"

@class UIViewController;

@interface MainAssembly : NSObject

+ (UIViewController *)instantiateViewController;

+ (UIViewController<MainInput> *)assembly;
+ (UIViewController<MainInput> *)assemblyWithOutput:(id<MainOutput>)output inputData:(MainInputData *)inputData;
+ (UIViewController<MainInput> *)assemblyWithOutput:(id<MainOutput>)output;
+ (UIViewController<MainInput> *)assemblyWithInputData:(MainInputData *)inputData;

+ (UIViewController<MainInput> *)assembly:(UIViewController *)vc;

@end
