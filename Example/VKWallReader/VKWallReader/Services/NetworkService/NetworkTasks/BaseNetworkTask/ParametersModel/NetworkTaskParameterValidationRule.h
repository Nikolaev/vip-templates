//
//  NetworkTaskParameterValidationRule.h
//
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016 All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSError *(^ParameterValidatioBlock)(id value);

@interface NetworkTaskParameterValidationRule : NSObject

@property (assign, nonatomic) BOOL isOptional;
@property (strong, nonatomic) Class classType;
@property (copy, nonatomic) ParameterValidatioBlock validationBlock;

@end
