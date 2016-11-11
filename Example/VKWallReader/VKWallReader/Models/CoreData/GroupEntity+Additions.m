//
//  GroupEntity+Additions.m
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupEntity+Additions.h"

@implementation GroupEntity (Additions)

- (void)updateWithModel:(GroupNetworkModel *)model
{
    self.uid = model.gid;
    self.name = model.name;
    self.photoURL = model.photo;
}

- (GroupModel *)plainObject
{
    GroupModel *plainObject = [GroupModel new];
    plainObject.uid = self.uid;
    plainObject.name = self.name;
    plainObject.photoURL = self.photoURL;
    return plainObject;
}

@end
