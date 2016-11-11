//
//  GroupWallModels.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface GroupWallRequest : NSObject
//
//@end
//
//@interface GroupWallResponce : NSObject
//
//@end
//
//@interface GroupWallViewModel : NSObject
//
//@end

@interface WallPostViewModel : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userAvatarURL;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSNumber *photoWidth;
@property (strong, nonatomic) NSNumber *photoHeight;

@end
