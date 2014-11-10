//
//  PropoundDisplayView.m
//  Propound
//
//  Created by Scott Sollows on 2014-11-09.
//  Copyright (c) 2014 Scott Sollows. All rights reserved.
//

#import "PropoundDisplayView.h"

@interface PropoundDisplayView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)closeButton:(id)sender;

@end
@implementation PropoundDisplayView

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self == [super initWithCoder:aDecoder]){
    }
    return self;
}

-(void)populateWithPropound:(Propound*)propound{
    self.nameLabel.text = propound.name;
    self.genderLabel.text = propound.gender;
    self.ageLabel.text = propound.age;
    self.descriptionText.text = propound.descriptionText;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)closeButton:(id)sender {
    [self removeFromSuperview];
}
@end
