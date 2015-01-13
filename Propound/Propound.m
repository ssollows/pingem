//
//  Propound.m
//  Pingem
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "Propound.h"
#import <Parse/PFObject+Subclass.h>

@implementation Propound
@dynamic descriptionText;
@dynamic name;
@dynamic age;
@dynamic gender;
@dynamic latitude;
@dynamic longitude;
@dynamic user;

+ (NSString *)parseClassName {
    return @"Propound";
}
@end
