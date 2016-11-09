//
//  WallPostNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface WallPostNetworkModel : JSONModel

@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) NSString *posterID;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *photoURL;

@end
