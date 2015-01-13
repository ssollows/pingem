//
//  SubmitViewController.h
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SubmitViewController : UIViewController
@property CLLocation* location;
@property UITabBarController *tabBarController;
@end

