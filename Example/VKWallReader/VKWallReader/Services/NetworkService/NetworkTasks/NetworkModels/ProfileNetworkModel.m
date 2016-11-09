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

@end
