//
//  TweetCell.h
//  twitter
//
//  Created by Gisele Phalo on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

// @property (strong, nonatomic) UIColor  *mainColor;

@property (weak, nonatomic) IBOutlet UIImageView *tweetImage;
@property (weak, nonatomic) IBOutlet UILabel *tweetUser;
@property (weak, nonatomic) IBOutlet UILabel *tweetHandle;
@property (weak, nonatomic) IBOutlet UILabel *tweetTime;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (strong, nonatomic) Tweet *tweet;

@property (weak, nonatomic) IBOutlet UIButton *tweetFavorite;
@property (weak, nonatomic) IBOutlet UIButton *tweetRetweet;

@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *faveLabel;





@end
