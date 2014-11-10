//
//  SecondViewController.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "SecondViewController.h"
#import "Propound.h"
#import <Parse/Parse.h>
@interface SecondViewController ()
- (IBAction)handleSubmitButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *genderText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSubmitButton:(id)sender {
    Propound* pp =  (Propound*)[PFObject objectWithClassName:@"Propound"];
    pp.description =  @"looking for someone in red hat";
    pp.age = @"25";
    pp.longitude = self.location.coordinate.longitude;
    pp.latitude = self.location.coordinate.latitude;
    pp.user = [PFUser currentUser];
    self.submitButton.enabled = NO;
    [pp saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"saved!!");
        self.submitButton.enabled = YES;
    }];
}
@end
