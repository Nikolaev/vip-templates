//
//  NSThread+MainThread.h
//
//  Created by nvv on 04.02.16.
//  Copyright © 2016 organization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (MainThread)

+ (void)performOnMainThread:(void (^)())block;
+ (void)performOnMainThreadWithDelay:(NSTimeInterval)delay block:(void (^)())block;

@end
