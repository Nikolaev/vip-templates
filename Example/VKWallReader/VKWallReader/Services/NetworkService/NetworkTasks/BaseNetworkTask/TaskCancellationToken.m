//
//  TaskCancellationToken.m
//  ICNetworkHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import "TaskCancellationToken.h"

@interface TaskCancellationToken ()

@property (copy, nonatomic) TaskCancellationTokenBlock cancelBlock;

@end

@implementation TaskCancellationToken

- (instancetype)initWithCancelBlock:(TaskCancellationTokenBlock)cancelBlock
{
    self = [super init];
    if (self) {
        _cancelBlock = cancelBlock;
    }
    return self;
}

- (void)cancelTask
{
    _isCancelled = YES;
    if (self.cancelBlock != nil) {
        self.cancelBlock();
    }
}

@end
