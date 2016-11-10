//
//  WallPostModel.h
//  VKWallReader
//
//  Created by nvv on 09.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WallPostModel : NSObject

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *posterID;
@property (nonatomic, strong) NSString *posterName;
@property (nonatomic, strong) NSString *posterAvatarURL;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *photoURL;
@property (strong, nonatomic) NSNumber *photoWidth;
@property (strong, nonatomic) NSNumber *photoHeight;

@end
