//
//  WallNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "WallPostNetworkModel.h"
#import "ProfileNetworkModel.h"
#import "GroupNetworkModel.h"

@interface WallNetworkModel : JSONModel

@property (strong, nonatomic) NSArray<WallPostNetworkModel *> *wall;
@property (strong, nonatomic) NSArray<ProfileNetworkModel *> *profiles;
@property (strong, nonatomic) NSArray<GroupNetworkModel *> *groups;

@end
