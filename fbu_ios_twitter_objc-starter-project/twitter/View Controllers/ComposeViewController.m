//
//  ComposeViewController.m
//  
//
//  Created by Gisele Phalo on 7/3/18.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"


@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetText;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //TweetCell *cell = [[TweetCell alloc] init];
    //Tweet *firstTweet = [[Tweet alloc] init];
    //cell.tweet = [[Tweet alloc] init];
    //cell.mainColor = [UIColor redColor];

    // Do any additional setup after loading the view.
}

- (IBAction)onTapClose:(id)sender {
     [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)onTapTweet:(id)sender {
    [[APIManager shared]postStatusWithText:self.tweetText.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];

            NSLog(@"Compose Tweet Success!");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
