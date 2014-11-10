//
//  NavigationController.h
//  Propound
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface NavigationController : UITabBarController<UITabBarDelegate,UITabBarControllerDelegate,CLLocationManagerDelegate>
@property NSMutableArray* propounds;
@end
