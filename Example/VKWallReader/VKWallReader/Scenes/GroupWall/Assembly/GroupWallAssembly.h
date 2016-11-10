//
//  GroupWallAssembly.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "GroupWallInput.h"
#import "GroupWallOutput.h"
#import "GroupWallInputData.h"

@class UIViewController;

@interface GroupWallAssembly : NSObject

+ (UIViewController *)instantiateViewController;

+ (UIViewController<GroupWallInput> *)assembly;
+ (UIViewController<GroupWallInput> *)assemblyWithOutput:(id<GroupWallOutput>)output inputData:(GroupWallInputData *)inputData;
+ (UIViewController<GroupWallInput> *)assemblyWithOutput:(id<GroupWallOutput>)output;
+ (UIViewController<GroupWallInput> *)assemblyWithInputData:(GroupWallInputData *)inputData;

+ (UIViewController<GroupWallInput> *)assembly:(UIViewController *)vc;

@end
