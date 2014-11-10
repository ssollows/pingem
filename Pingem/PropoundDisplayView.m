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
@property (weak, nonatomic) IBOutlet UIView *replyView;
@property (weak, nonatomic) IBOutlet UITextView *replyText;
- (IBAction)handleReplyButton:(id)sender;
- (IBAction)closeButton:(id)sender;
- (IBAction)handleSendButton:(id)sender;

@end
@implementation PropoundDisplayView

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self == [super initWithCoder:aDecoder]){
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapReceived:)];
        [tapGestureRecognizer setDelegate:self];
        [self addGestureRecognizer:tapGestureRecognizer];

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

- (IBAction)handleSendButton:(id)sender {
    [self.replyView setHidden:YES];
}

- (IBAction)handleReplyButton:(id)sender {
    [self.replyView setHidden:NO];
}


-(void)tapReceived:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"in here");
    if ([self.replyText isFirstResponder] && [tapGestureRecognizer view] != self.replyText) {
        [self.replyText resignFirstResponder];
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"in here");
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.replyText isFirstResponder] && [touch view] != self.replyText) {
        [self.replyText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}



@end
