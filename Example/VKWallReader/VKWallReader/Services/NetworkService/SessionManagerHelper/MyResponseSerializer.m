//
//ResponseSerializer.m
//
//
//  Created by nikolaev on 30/03/16.
//  Copyright © 2016 All rights reserved.
//

#import "MyResponseSerializer.h"
#import "ErrorsHelper.h"

@implementation MyResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    id responseToReturn = [super responseObjectForResponse:response
                                                      data:data
                                                     error:error];
    if (*error == nil) {
        if ([responseToReturn isKindOfClass:[NSDictionary class]]) {
            if (responseToReturn[@"error"] != nil) {
                NSDictionary *errorDict = responseToReturn[@"error"];
                NSString *msg = errorDict[@"error_msg"];
                *error = [ErrorsHelper errorWithDescription:msg code:[(NSHTTPURLResponse *)response statusCode]];
            } else if (responseToReturn[@"response"] != nil) {
                responseToReturn = responseToReturn[@"response"];
            }
        }
    }
    return responseToReturn;
}

@end
