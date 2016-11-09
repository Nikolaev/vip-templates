//
//  GroupDetailsCell.m
//  VKWallReader
//
//  Created by nvv on 08.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "GroupDetailsCell.h"
#import "MainModels.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@interface GroupDetailsCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation GroupDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithModel:(MainGroupViewModel *)model
{
    self.lblName.text = model.name;
    NSURL *url = [NSURL URLWithString:model.avatarURL];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    self.ivIcon.image = nil;
    [self.ivIcon setImageWithURLRequest:req placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.ivIcon.image = image;
        self.activityIndicator.hidden = YES;
        [self.activityIndicator stopAnimating];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        self.activityIndicator.hidden = YES;
        [self.activityIndicator stopAnimating];
    }];
}

@end
