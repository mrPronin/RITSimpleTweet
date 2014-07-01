//
//  RITViewController.m
//  RITSimpleTweet
//
//  Created by Pronin Alexander on 29.06.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"
#import <Social/Social.h>

@interface RITViewController ()

@property (strong, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSString *urlString;

- (void) clearLabels;

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (void)shareText:(NSString *)text andImage:(UIImage *)image andUrl:(NSURL *)url
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (text) {
        [sharingItems addObject:text];
    }
    if (image) {
        [sharingItems addObject:image];
    }
    if (url) {
        [sharingItems addObject:url];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    //activityController.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void) clearLabels
{

    self.button1Label.textColor = [UIColor whiteColor];
    self.button2Label.textColor = [UIColor whiteColor];
    self.button3Label.textColor = [UIColor whiteColor];
    self.button4Label.textColor = [UIColor whiteColor];
    
}

#pragma mark - Actions

- (IBAction)button1Tapped:(UIButton *)sender {
    
    [self clearLabels];
    self.imageString = @"CheatSheetButton.png";
    self.urlString = @"http://www.raywenderlich.com/4872/objective-c-cheat-sheet-and-quick-reference";
    self.button1Label.textColor = [UIColor redColor];
    
}

- (IBAction)button2Tapped:(UIButton *)sender {
    
    [self clearLabels];
    self.imageString = @"HorizontalTablesButton.png";
    self.urlString = @"http://www.raywenderlich.com/4723/how-to-make-an-interface-with-horizontal-tables-like-the-pulse-news-app-part-2";
    self.button2Label.textColor = [UIColor redColor];
    
}

- (IBAction)button3Tapped:(UIButton *)sender {
    
    [self clearLabels];
    self.imageString = @"PathfindingButton.png";
    self.urlString = @"http://www.raywenderlich.com/4946/introduction-to-a-pathfinding";
    self.button3Label.textColor = [UIColor redColor];
    
}

- (IBAction)button4Tapped:(UIButton *)sender {
    
    [self clearLabels];
    self.imageString = @"UIKitButton.png";
    self.urlString = @"http://www.raywenderlich.com/4817/how-to-integrate-cocos2d-and-uikit";
    self.button3Label.textColor = [UIColor redColor];
    
}

- (IBAction)tweetTapped:(UIButton *)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Tweeting from my app!"];
        
        if (self.imageString) {
            
            [tweetSheet addImage:[UIImage imageNamed:self.imageString]];
            
        }
        
        if (self.urlString) {
            
            [tweetSheet addURL:[NSURL URLWithString:self.urlString]];
            
        }
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
        [alertView show];
        
    }
    
}

- (IBAction)actionActivityViewControllerButton:(UIButton *)sender {
    
    [self shareText:@"Test share text" andImage:[UIImage imageNamed:self.imageString] andUrl:[NSURL URLWithString:self.urlString]];
    
}

@end
