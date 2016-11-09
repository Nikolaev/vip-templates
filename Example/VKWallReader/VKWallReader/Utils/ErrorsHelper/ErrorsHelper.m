//
//  ErrorsHelper.m
//
//  Created by nikolaev on 30/03/16.
//

#import "ErrorsHelper.h"

NSString *const kAlieErrorDomain = @"com.nvv.VKWallReader";

@implementation ErrorsHelper

+ (NSError *)errorWithDescription:(NSString *)description
{
    return [self errorWithDescription:description code:0];
}

+ (NSError *)errorWithDescription:(NSString *)description code:(NSInteger)code
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[NSLocalizedDescriptionKey] = description;
    NSError *error = [NSError errorWithDomain:kAlieErrorDomain
                                         code:code
                                     userInfo:userInfo];
    return error;
}

@end
