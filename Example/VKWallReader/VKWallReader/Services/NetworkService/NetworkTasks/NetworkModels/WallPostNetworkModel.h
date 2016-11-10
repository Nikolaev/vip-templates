//
//  WallPostNetworkModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol WallPostNetworkModel <NSObject>
@end

@interface WallPostNetworkModel : JSONModel <WallPostNetworkModel>

@property (strong, nonatomic) NSString *uid;
@property (strong, nonatomic) NSString *posterID;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSNumber *photoWidth;
@property (strong, nonatomic) NSNumber *photoHeight;

@end
