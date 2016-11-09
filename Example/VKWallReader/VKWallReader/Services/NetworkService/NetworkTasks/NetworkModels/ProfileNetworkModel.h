//
//  ProfileNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ProfileNetworkModel : JSONModel

@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *avatarURL;

@end
