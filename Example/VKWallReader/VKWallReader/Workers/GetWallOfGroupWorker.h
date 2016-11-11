//
//  GetWallOfGroupWorker.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WallPostModel.h"

@interface GetWallOfGroupWorker : NSObject

- (void)getWallOfGroup:(NSString *)groupID
                offset:(NSUInteger)offset
                 count:(NSUInteger)count
              callback:(void (^)(NSArray<WallPostModel *> *posts, NSError *error))callback;

@end
