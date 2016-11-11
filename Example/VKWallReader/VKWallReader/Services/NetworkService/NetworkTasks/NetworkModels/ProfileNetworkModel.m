//
//  ProfileNetworkModel.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "ProfileNetworkModel.h"

@implementation ProfileNetworkModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"firstName": @"first_name",
                                                                  @"lastName": @"last_name",
                                                                  @"avatarURL": @"photo"
                                                                  }];
}

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    self.firstName = [self.firstName stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    self.firstName = [self.firstName stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    self.lastName = [self.lastName stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    self.lastName = [self.lastName stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    return YES;
}

@end
