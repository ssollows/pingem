//
//  SettingsViewController.h
//  Propound
//
//  Created by Scott Sollows on 2014-11-10.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface SettingsViewController : UIViewController
@property (strong, nonatomic) User* user;
-(void)populateSettings;
@end
