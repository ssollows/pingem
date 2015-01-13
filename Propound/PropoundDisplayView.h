//
//  PropoundDisplayView.h
//  Propound
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Propound.h"

@interface PropoundDisplayView : UIView<UIGestureRecognizerDelegate>
-(void)populateWithPropound:(Propound*)propound;
@end
