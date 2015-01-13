//
//  SettingsViewController.m
//  Propound
//
//  Created by Scott Sollows on 2014-11-10.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *ageText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (strong, nonatomic) User* user;
- (IBAction)handleSaveButton:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = (User*)[PFUser currentUser];
}

- (IBAction)handleSaveButton:(id)sender {
    self.user.name = self.nameText.text ? self.nameText.text : @"";
    self.user.age = self.ageText.text ? self.ageText.text : @"";
    self.user.gender = self.genderSegment.selectedSegmentIndex == 0 ? @"male" : @"female";
    [self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"this is it!");
    }];
}

-(void)populateSettings{
    self.nameText.text = self.user.name;
    self.ageText.text = self.user.age;
    if([self.user.gender isEqualToString:@"male"]){
        self.genderSegment.selectedSegmentIndex = 0;
    } else {
        self.genderSegment.selectedSegmentIndex = 1;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.nameText isFirstResponder] && [touch view] != self.nameText) {
        [self.nameText resignFirstResponder];
    } else if([self.ageText isFirstResponder] && [touch view] != self.ageText){
        [self.ageText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
