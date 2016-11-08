//
//  NSThread+MainThread.m
//
//  Created by nvv on 04.02.16.
//  Copyright © 2016 organization. All rights reserved.
//

#import "NSThread+MainThread.h"

@implementation NSThread (MainThread)

+ (void)performOnMainThread:(void (^)())block {
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+ (void)performOnMainThreadWithDelay:(NSTimeInterval)delay block:(void (^)())block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (block != nil) {
            block();
        }
    });
}

@end
