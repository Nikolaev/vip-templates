//
//  ProfileNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ProfileNetworkModel <NSObject>
@end

@interface ProfileNetworkModel : JSONModel <ProfileNetworkModel>

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *avatarURL;

@end
