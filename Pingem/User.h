//
//  User.h
//  Propound
//
//  Created by Scott Sollows on 2014-11-10.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *gender;
@property (strong,nonatomic) NSString *age;
-(User*)currentUser;
@end
