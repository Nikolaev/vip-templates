//
//  WallPostCell.m
//  VKWallReader
//
//  Created by nvv on 10.11.16.
//  Copyright © 2016 nvv. All rights reserved.
//

#import "WallPostCell.h"
#import "GroupWallModels.h"
#import <AFNetworking/UIKit+AFNetworking.h>

@interface WallPostCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UIImageView *ivUserAvatar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aivUserAvatar;
@property (weak, nonatomic) IBOutlet UITextView *tvText;
@property (weak, nonatomic) IBOutlet UIImageView *ivPostPhoto;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aivPostPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tvTextHeiht;

@property (assign, nonatomic) CGFloat lastKnownWidth;

@end

@implementation WallPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tvText.textContainer.lineFragmentPadding = 0;
    [self.tvText setContentInset:UIEdgeInsetsZero];
    [self.tvText setTextContainerInset:UIEdgeInsetsZero];
    [self.tvText setContentOffset:CGPointZero];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)updateWithModel:(WallPostViewModel *)model width:(CGFloat)width
{
    self.lblUsername.text = model.userName;
    self.tvText.text = model.text;
    self.tvTextHeiht.constant = ceilf([self.tvText sizeThatFits:CGSizeMake(width - 30., FLT_MAX)].height);
    
    NSURL *url = [NSURL URLWithString:model.userAvatarURL];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    self.aivUserAvatar.hidden = NO;
    [self.aivUserAvatar startAnimating];
    self.ivUserAvatar.image = nil;
    __weak typeof(self) wself = self;
    [self.ivUserAvatar setImageWithURLRequest:req placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        wself.ivUserAvatar.image = image;
        wself.aivUserAvatar.hidden = YES;
        [wself.aivUserAvatar stopAnimating];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        wself.aivUserAvatar.hidden = YES;
        [wself.aivUserAvatar stopAnimating];
    }];
    if (model.photoURL != nil) {
        CGFloat ivWidth = self.ivPostPhoto.frame.size.width;
        CGSize photoSize = CGSizeZero;
        if (model.photoWidth.doubleValue > ivWidth) {
            photoSize.width = ivWidth;
        } else{
            photoSize.width = model.photoWidth.doubleValue;
        }
        photoSize.height = photoSize.width * model.photoHeight.doubleValue / model.photoWidth.doubleValue;
        self.photoHeight.constant = photoSize.height;
        self.photoBottom.constant = 15.;
        
        url = [NSURL URLWithString:model.photoURL];
        req = [NSURLRequest requestWithURL:url];
        self.aivPostPhoto.hidden = NO;
        [self.aivPostPhoto startAnimating];
        self.ivPostPhoto.image = nil;
        __weak typeof(self) wself = self;
        self.ivPostPhoto.alpha = 0.;
        [self.ivPostPhoto setImageWithURLRequest:req placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
            wself.ivPostPhoto.image = image;
            wself.aivPostPhoto.hidden = YES;
            [wself.aivPostPhoto stopAnimating];
            [UIView animateWithDuration:0.1 animations:^{
                wself.ivPostPhoto.alpha = 1.;
            }];
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            wself.aivPostPhoto.hidden = YES;
            [wself.aivPostPhoto stopAnimating];
        }];
    } else {
        self.ivPostPhoto.image = nil;
        self.photoHeight.constant = 0.;
        self.photoBottom.constant = 0.;
    }
}

@end
