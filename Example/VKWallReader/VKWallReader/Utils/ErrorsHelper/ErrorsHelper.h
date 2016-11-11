//
//  ErrorsHelper.h
//
//  Created by nikolaev on 30/03/16.
//

#import <Foundation/Foundation.h>

extern NSString *const kAlieErrorDomain;

@interface ErrorsHelper : NSObject

+ (NSError *)errorWithDescription:(NSString *)description;
+ (NSError *)errorWithDescription:(NSString *)description code:(NSInteger)code;

@end
