//
//  RITViewController.h
//  RITSimpleTweet
//
//  Created by Pronin Alexander on 29.06.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RITViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *button1Label;
@property (weak, nonatomic) IBOutlet UILabel *button2Label;
@property (weak, nonatomic) IBOutlet UILabel *button3Label;
@property (weak, nonatomic) IBOutlet UILabel *button4Label;

- (IBAction)button1Tapped:(UIButton *)sender;
- (IBAction)button2Tapped:(UIButton *)sender;
- (IBAction)button3Tapped:(UIButton *)sender;
- (IBAction)button4Tapped:(UIButton *)sender;
- (IBAction)tweetTapped:(UIButton *)sender;

- (IBAction)actionActivityViewControllerButton:(UIButton *)sender;
@end
