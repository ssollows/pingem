//
//  FirstViewController.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//
#import "FirstViewController.h"
#import "Marker.h"
#import "Propound.h"
#import "PropoundDisplayView.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIView *mapViewContainer;
@property (strong, nonatomic) GMSMapView *googleMapView;
@property PropoundDisplayView* currentPropoundView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated{
    [[self.mapViewContainer subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.location.coordinate.latitude
                                                            longitude:self.location.coordinate.longitude
                                                                 zoom:15];

    NSLog(@"self.location.coordinate.longitude %f",self.view.bounds.size.width);
    
    self.googleMapView = [GMSMapView mapWithFrame:self.mapViewContainer.frame camera:camera];
    Marker *marker = [[Marker alloc] init];

    self.googleMapView.delegate = self;
    
    marker.position = self.location.coordinate;
    marker.snippet = @"You";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = self.googleMapView;
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    
    [self.googleMapView setMinZoom:15 maxZoom:22];
    [self.mapViewContainer addSubview:self.googleMapView];
    
    
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
