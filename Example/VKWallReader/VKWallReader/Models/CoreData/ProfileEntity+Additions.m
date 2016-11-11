//
//  ProfileEntity+Additions.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "ProfileEntity+Additions.h"

@implementation ProfileEntity (Additions)

- (void)updateWithModel:(ProfileNetworkModel *)model
{
    self.uid = model.uid;
    self.firstName = model.firstName;
    self.lastName = model.lastName;
    self.avatarURL = model.avatarURL;
}

- (ProfileModel *)plainObject
{
    ProfileModel *obj = [ProfileModel new];
    obj.uid = self.uid;
    obj.firstName = self.firstName;
    obj.lastName = self.lastName;
    obj.avatarURL = self.avatarURL;
    return obj;
}

@end
