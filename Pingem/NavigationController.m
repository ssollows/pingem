//
//  NavigationController.m
//  Propound
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "NavigationController.h"
#import "MapViewController.h"
#import "SubmitViewController.h"
#import "SettingsViewController.h"
#import "Propound.h"
#import <Parse/Parse.h>

@interface NavigationController ()
@property (strong) CLLocationManager *locationManager;
@property (strong, nonatomic) User* user;
@property CLLocation* location;

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = (User*)[PFUser currentUser];
}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[SubmitViewController class]]){
        SubmitViewController* vc = (SubmitViewController*)viewController;
        vc.location = self.location;
        vc.tabBarController = self;
    } else if ([viewController isKindOfClass:[MapViewController class]]){
        MapViewController* vc = (MapViewController*)viewController;
        self.locationManager.delegate = vc;
        vc.location = [self.locationManager location];
    } else if ([viewController isKindOfClass:[SettingsViewController class]]){
        SettingsViewController* vc = (SettingsViewController*)viewController;
        vc.user = self.user;
        [vc populateSettings];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
