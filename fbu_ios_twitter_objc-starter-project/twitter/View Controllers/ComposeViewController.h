//
//  ComposeViewController.h
//  
//
//  Created by Gisele Phalo on 7/3/18.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
@protocol ComposeViewControllerDelegate
    
    - (void)didTweet:(Tweet *)tweet;
@end


@interface ComposeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *composeText;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;


@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

@end

