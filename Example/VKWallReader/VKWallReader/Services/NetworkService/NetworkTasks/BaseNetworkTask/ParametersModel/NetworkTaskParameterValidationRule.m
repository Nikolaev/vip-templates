//
//  NetworkTaskParameterValidationRule.m
//
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016 All rights reserved.
//

#import "NetworkTaskParameterValidationRule.h"

@implementation NetworkTaskParameterValidationRule

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void) initialize
{
    self.validationBlock =  ^NSError*(id value) {
        return nil;
    };
}

@end
