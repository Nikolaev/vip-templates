//
//  NetworkTaskParameterValidationRule+Rules.m
//
//
//  Created by nikolaev on 30/03/16.
//  Copyright © 2016 All rights reserved.
//

#import "NetworkTaskParameterValidationRule+Rules.h"
#import "ErrorsHelper.h"

@implementation NetworkTaskParameterValidationRule (Rules)

+ (ParameterValidatioBlock)emailValidationBlock
{
    ParameterValidatioBlock block = ^NSError*(id value) {
        NSString *checkString = value;
        BOOL stricterFilter = NO;
        NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
        NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
        NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        BOOL isValidEmail = [emailTest evaluateWithObject:checkString];
        if (!isValidEmail) {
            NSError *error = [ErrorsHelper errorWithDescription:NSLocalizedString(@"kAlertMessageWrongEmail", nil)];
            return error;
        }
        return nil;
    };
    return block;
}


@end
