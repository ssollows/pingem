//
//  Propound.h
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Propound : PFObject<PFSubclassing>
@property NSString *description;
@property NSString *name;
@property NSString *age;
@property NSString *gender;
@property float latitude;
@property float longitude;
@property PFUser *user;

+ (NSString *)parseClassName;
@end
