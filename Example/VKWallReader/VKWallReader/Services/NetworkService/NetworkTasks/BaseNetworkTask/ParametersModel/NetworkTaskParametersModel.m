//
//  NetworkTaskParametersModel.m
//
//
//  Created by nikolaev on 29/03/16.
//  Copyright © 2016 All rights reserved.
//

#import "NetworkTaskParametersModel.h"
#import "ErrorsHelper.h"

#pragma mark - NetworkTaskParameter

@interface NetworkTaskParameter : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSObject *value;
@property (strong, nonatomic) NetworkTaskParameterValidationRule *validationRule;

- (NSError *)validate;

@end

@implementation NetworkTaskParameter

- (NSError *)validate
{
    if (!self.validationRule.isOptional && (self.value == nil || [self.value isKindOfClass:[NSNull class]])) {
        NSError *error = [ErrorsHelper errorWithDescription:[NSString stringWithFormat:@"Missing mandatory parameter: '%@'", self.name]];
        return error;
    }
    if (self.value != nil && self.validationRule.classType !=nil && ![self.value isKindOfClass:self.validationRule.classType]) {
        NSError *error = [ErrorsHelper errorWithDescription:[NSString stringWithFormat:@"Invalid parameter: '%@'", self.name] ];
        return error;
    }
    if (self.validationRule .validationBlock != nil) {
        return self.validationRule.validationBlock(self.value);
    }
    return nil;
}

@end

#pragma mark - NetworkTaskParametersModel

@interface NetworkTaskParametersModel()

@property (strong, nonatomic) NSMutableDictionary *parameters;

@end

@implementation NetworkTaskParametersModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.parameters = [NSMutableDictionary dictionary];
}

- (void)addParameter:(NSString *)name value:(NSObject *)value;
{
    [self addParameter:name value:value validationRule:nil];
}

- (void)addParameter:(NSString *)name value:(NSObject *)value isOptional:(BOOL)isOptional
{
    NetworkTaskParameterValidationRule *validationRule = [NetworkTaskParameterValidationRule new];
    validationRule.isOptional = isOptional;
    [self addParameter:name value:value validationRule:validationRule];
}

- (void)addParameter:(NSString *)name value:(NSObject *)value validationRule:(NetworkTaskParameterValidationRule *)validationRule
{
    if (name == nil || [name isKindOfClass:[NSNull class]] || [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        return;
    }
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        return;
    }
    NetworkTaskParameter *param = [NetworkTaskParameter new];
    param.name = name;
    param.value = value;
    param.validationRule = validationRule;
    self.parameters[name] = param;
}

- (NSError *)validate
{
    NSError *error = nil;
    for (NetworkTaskParameter *param in self.parameters.allValues) {
        error = [param validate];
        if (error != nil) {
            break;
        }
    }
    return error;
}

- (NSDictionary *)generateParametersDictionary
{
    NSError *error = [self validate];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (error == nil) {
        for (NetworkTaskParameter *param in self.parameters.allValues) {
            dict[param.name] = param.value;
        }
    }
    return dict;
}

@end
