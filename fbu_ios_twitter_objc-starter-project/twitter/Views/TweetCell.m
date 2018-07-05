//
//  TweetCell.m
//  twitter
//
//  Created by Gisele Phalo on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "APIManager.h"
#import "TweetCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>


@implementation TweetCell

- (void) refreshData {
    [self.tweetImage setImageWithURL:self.tweet.user.imageURL];
    self.tweetUser.text = self.tweet.user.name;
    NSString * fullScreenName = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.tweetHandle.text = fullScreenName;
    
    self.tweetTime.text = self.tweet.createdAtString;
    self.tweetText.text = self.tweet.text;
    self.retweetLabel.text = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
    self.faveLabel.text = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
    
    // Just Views
    
}

- (IBAction)didTapFavorite:(id)sender {
    if (self.tweetFavorite.selected == NO) {//like
        self.tweetFavorite.selected = YES;
        self.tweet.favoriteCount += 1;
    [self refreshData];
    [[APIManager shared] postFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        NSLog(@"hey it works!");
    }];
    }
    else{//dislike
        self.tweetFavorite.selected = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData];
        [[APIManager shared] postNotFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            NSLog(@"hey it works!");
        }];
    }
}
- (IBAction)didTapShare:(id)sender {
    if (self.tweetRetweet.selected == NO) {//like
        self.tweetRetweet.selected = YES;
        self.tweet.retweetCount += 1;
        [self refreshData];
        [[APIManager shared] postShare:self.tweet completion:^(Tweet *tweet, NSError *error) {
            NSLog(@"hey it works!");
        }];
    }
    else{//dislike
        self.tweetRetweet.selected = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData];
        [[APIManager shared] postNotShare:self.tweet completion:^(Tweet *tweet, NSError *error) {
            NSLog(@"hey it works!");
        }];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    [self refreshData];
    
    // Data and Views
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    // Configure the view for the selected state
}

@end
