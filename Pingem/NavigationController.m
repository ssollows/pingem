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

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = (User*)[PFUser currentUser];
    
    if(self.locationManager == nil){
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        [self.locationManager requestAlwaysAuthorization];
        MapViewController* mapVC = (MapViewController*)[self.navigationController visibleViewController];
        mapVC.locationManager = self.locationManager;
    }
}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[SubmitViewController class]]){
        SubmitViewController* vc = (SubmitViewController*)viewController;
        vc.location = [self.locationManager location];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
