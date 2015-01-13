//
//  MapViewController.h
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate, GMSMapViewDelegate>
@property CLLocation* location;
@property NSArray *propounds;
@property (strong) CLLocationManager *locationManager;

@end

