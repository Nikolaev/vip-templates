//
//  TaskCancellationToken.h
//  ICNetworkHelper
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016  . All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TaskCancellationTokenBlock)();

@interface TaskCancellationToken : NSObject

- (instancetype)initWithCancelBlock:(TaskCancellationTokenBlock)cancelBlock;

@property (readonly, nonatomic) BOOL isCancelled;
@property (assign, nonatomic) BOOL performCallbackIfCanceled;

- (void)cancelTask;

@end
