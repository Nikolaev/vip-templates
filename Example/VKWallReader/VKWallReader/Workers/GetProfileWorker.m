//
//  GetProfileWorker.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GetProfileWorker.h"
#import "ProfileEntity+Additions.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation GetProfileWorker

- (ProfileModel *)getProfileWithId:(NSString *)uid
{
    ProfileEntity *profile = [ProfileEntity MR_findFirstByAttribute:@"uid" withValue:uid];
    if (profile != nil) {
        ProfileModel *model = [profile plainObject];
        return model;
    } else {
        return nil;
    }
}

@end
