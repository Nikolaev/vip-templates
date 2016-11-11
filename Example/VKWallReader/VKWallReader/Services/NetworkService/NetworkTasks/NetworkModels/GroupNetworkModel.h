//
//  GroupNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol GroupNetworkModel <NSObject>
@end

@interface GroupNetworkModel : JSONModel <GroupNetworkModel>

@property (strong, nonatomic) NSString *gid;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *photo;

@end
