//
//  WallPostCell.h
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WallPostViewModel;

@interface WallPostCell : UITableViewCell

- (void)updateWithModel:(WallPostViewModel *)model width:(CGFloat)width;

@end
