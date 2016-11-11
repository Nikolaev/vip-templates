//
//  ProfileEntity+Additions.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "ProfileEntity+CoreDataClass.h"
#import "ProfileNetworkModel.h"
#import "ProfileModel.h"

@interface ProfileEntity (Additions)

- (void)updateWithModel:(ProfileNetworkModel *)model;
- (ProfileModel *)plainObject;

@end
