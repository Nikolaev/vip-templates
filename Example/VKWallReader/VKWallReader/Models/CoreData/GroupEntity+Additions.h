//
//  GroupEntity+Additions.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupEntity+CoreDataClass.h"
#import "GroupNetworkModel.h"
#import "GroupModel.h"

@interface GroupEntity (Additions)

- (void)updateWithModel:(GroupNetworkModel *)model;
- (GroupModel *)plainObject;

@end
