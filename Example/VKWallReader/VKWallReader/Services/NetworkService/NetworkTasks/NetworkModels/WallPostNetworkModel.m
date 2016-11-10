//
//  WallPostNetworkModel.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "WallPostNetworkModel.h"

@implementation WallPostNetworkModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"uid": @"id",
                                                                  @"posterID": @"from_id",
                                                                  @"text": @"text",
                                                                  @"photoURL": @"attachment.photo.src_big",
                                                                  @"photoWidth": @"attachment.photo.width",
                                                                  @"photoHeight": @"attachment.photo.height"
                                                                  }];
}

@end
