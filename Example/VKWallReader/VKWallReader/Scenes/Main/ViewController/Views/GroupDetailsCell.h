//
//  GroupDetailsCell.h
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainGroupViewModel;

@interface GroupDetailsCell : UITableViewCell

- (void)updateWithModel:(MainGroupViewModel *)model;

@end
