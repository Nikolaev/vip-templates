//
//  NetworkTaskParametersModel.h
//
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016 All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkTaskParameterValidationRule.h"
#import "NetworkTaskParameterValidationRule+Rules.h"

#define propertyKeyPath(property) (@""#property)
#define propertyKeyPathLastComponent(property) [[(@""#property) componentsSeparatedByString:@"."] lastObject]

@interface NetworkTaskParametersModel : NSObject

- (void)addParameter:(NSString *)name value:(NSObject *)value;
- (void)addParameter:(NSString *)name value:(NSObject *)value isOptional:(BOOL)isOptional;
- (void)addParameter:(NSString *)name value:(NSObject *)value validationRule:(NetworkTaskParameterValidationRule *)validationRule;

- (NSError *)validate;
- (NSDictionary *)generateParametersDictionary;

@end
