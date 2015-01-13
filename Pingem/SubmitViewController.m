//
//  SubmitViewController.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "SubmitViewController.h"
#import "Propound.h"
#import <Parse/Parse.h>

@interface SubmitViewController ()
- (IBAction)handleSubmitButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSelector;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)isFormValid{
    if([self.descriptionText.text length] < 10){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please enter a Description"
                                                        message:@"You must enter a description longer than 10 characters."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

- (IBAction)handleSubmitButton:(id)sender {
    if([self isFormValid]){
        Propound* pp =  (Propound*)[PFObject objectWithClassName:@"Propound"];
        
        self.submitButton.enabled = NO;
        pp.descriptionText =  self.descriptionText.text;
        pp.name = self.nameText.text;
        pp.gender = [self.genderSelector selectedSegmentIndex] == 0 ? @"female" : @"male";
        pp.age = self.ageText.text;
        pp.longitude = self.location.coordinate.longitude;
        pp.latitude = self.location.coordinate.latitude;
        pp.user = [PFUser currentUser];
        
        [pp saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            self.submitButton.enabled = YES;
            [self.tabBarController setSelectedIndex:0];
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.descriptionText isFirstResponder] && [touch view] != self.descriptionText) {
        [self.descriptionText resignFirstResponder];
    } else if ([self.ageText isFirstResponder] && [touch view] != self.ageText){
        [self.ageText resignFirstResponder];

    }else if([self.nameText isFirstResponder] && [touch view] != self.nameText){
        [self.nameText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
