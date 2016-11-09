//
//  GetGroupInfoWorker.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GroupModel.h"

@interface GetGroupInfoWorker : NSObject

- (GroupModel *)getGroupWithId:(NSString *)uid;
- (NSArray<GroupModel*>*)groupsWithIDS:(NSArray <NSString *>*)uids;

@end
