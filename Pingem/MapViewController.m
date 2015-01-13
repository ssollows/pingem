//
//  MapViewController.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//
#import "MapViewController.h"
#import "Marker.h"
#import "Propound.h"
#import "PropoundDisplayView.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIView *mapViewContainer;
@property (strong, nonatomic) NSMutableArray *markerArray;
@property (strong, nonatomic) GMSMapView *googleMapView;
@property (strong) CLLocationManager *locationManager;
@property PropoundDisplayView* currentPropoundView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.locationManager == nil){
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        [self.locationManager requestAlwaysAuthorization];
        self.location = [self.locationManager location];
    }
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:49.890
                                                            longitude:-119.48
                                                                 zoom:15];
    self.markerArray = [[NSMutableArray alloc]init];
    self.googleMapView = [GMSMapView mapWithFrame:self.mapViewContainer.frame camera:nil];
    self.googleMapView.delegate = self;
    self.googleMapView.camera = camera;

    [self.mapViewContainer addSubview:self.googleMapView];
    [self.googleMapView setMinZoom:15 maxZoom:22];


}

-(void)viewWillAppear:(BOOL)animated{
}

-(void)viewDidAppear:(BOOL)animated{
    [self resetMarkers];
    [self getCurrentPropounds];
    Marker *marker = [[Marker alloc] init];
    marker.position = CLLocationCoordinate2DMake(49.890, -119.48);
    marker.snippet = @"You";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = self.googleMapView;
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    [self.markerArray addObject:marker];
}

-(void)resetMarkers{
    for(Marker* marker in self.markerArray){
        marker.map = nil;
    }
    [self.markerArray removeAllObjects];
}

-(void)getCurrentPropounds{
    PFQuery *query = [PFQuery queryWithClassName:@"Propound"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            self.propounds = [NSMutableArray arrayWithArray:objects];
            
            for(Propound* propound in self.propounds){
                Marker *marker = [[Marker alloc] init];
                CLLocationCoordinate2D coordinate;
                
                coordinate.longitude = propound.longitude;
                coordinate.latitude = propound.latitude;
                
                marker.position = coordinate;
                marker.snippet = propound.name;
                marker.appearAnimation = kGMSMarkerAnimationPop;
                marker.map = self.googleMapView;
                marker.propound = propound;
                NSLog(@"add");
                [self.markerArray addObject:marker];
            }
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(Marker*)marker {
    if(marker.propound) {
        self.currentPropoundView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PropoundDisplayView class]) owner:self options:nil] objectAtIndex:0];
        self.currentPropoundView.frame = CGRectMake(20, 20, self.currentPropoundView.frame.size.width, self.currentPropoundView.frame.size.height);
        [self.currentPropoundView populateWithPropound:marker.propound];
        [self.googleMapView addSubview:self.currentPropoundView];
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
