//
//  GetProfileWorker.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileModel.h"

@interface GetProfileWorker : NSObject

- (ProfileModel *)getProfileWithId:(NSString *)uid;

@end
