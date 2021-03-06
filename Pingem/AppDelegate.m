//
//  AppDelegate.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "AppDelegate.h"
#import "Propound.h"
#import "User.h"
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [User registerSubclass];
    [Propound registerSubclass];
    [GMSServices provideAPIKey:@"AIzaSyBI0pj_2nG8ePN1WGQwtuU-F02L1fYwIJw"];
    [Parse setApplicationId:@"0d8mI1FZYTsm0QHXvWq9EPW43F2Te2l09Jx1mdaZ" clientKey:@"HzFV7wyCvitvPXBynvzKvuXtGPO5To8PC3NMwrg0"];
    [PFUser enableAutomaticUser];
    
    PFUser* user = [PFUser currentUser];
    [user incrementKey:@"RunCount"];
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
