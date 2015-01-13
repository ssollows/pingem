//
//  User.m
//  Propound
//
//  Created by Scott Sollows on 2014-11-10.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "User.h"

@implementation User

@dynamic name;
@dynamic gender;
@dynamic age;

-(User*)currentUser{
    return (User*)[PFUser currentUser];
}


@end
