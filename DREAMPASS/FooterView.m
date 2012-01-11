//
//  FooterView.m
//  CustomCellSample
//
//  Created by Hiroshi Hashiguchi on 11/07/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FooterView.h"


@implementation FooterView
@synthesize textLabel, detailTextLabel, imageView, activityIndicatorView;
@synthesize state = state_;
@synthesize footerView;

- (void)awakeFromNib
{
    self.state = FooterViewStateHidden;
    [self setUpdatedDate:nil];
}

- (void)_animateImageForHeadingUp:(BOOL)headingUp
{
    CGFloat startAngle = headingUp ? 0 : M_PI + 0.00001;
    CGFloat endAngle = headingUp ? M_PI + 0.00001 : 0;
    
    self.imageView.transform = CGAffineTransformMakeRotation(startAngle);           
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.imageView.transform =
                         CGAffineTransformMakeRotation(endAngle);
                     }];
    
}

- (void)setState:(FooterViewState)state
{
    switch (state) {
        case FooterViewStateHidden:
            [self.activityIndicatorView stopAnimating];
            self.imageView.hidden = YES;
            break;
            
        case FooterViewStatePullingDown:
            [self.activityIndicatorView stopAnimating];
            self.imageView.hidden = NO;
            self.textLabel.text = @"引き下げて...";
            if (state_ != FooterViewStatePullingDown) {
                [self _animateImageForHeadingUp:YES];
            }
            break;
            
        case FooterViewStateOveredThreshold:
            [self.activityIndicatorView stopAnimating];
            self.imageView.hidden = NO;
            self.textLabel.text = @"指をはなすと更新";
            if (state_ == FooterViewStatePullingDown) {
                [self _animateImageForHeadingUp:NO];
            }
            break;
            
        case FooterViewStateStopping:
            [self.activityIndicatorView startAnimating];
            self.textLabel.text = @"更新中...";
            self.imageView.hidden = YES;
            break;
    }
    
    state_ = state;
}

#pragma mark -
#pragma mark API


- (void)setUpdatedDate:(NSDate*)date
{
    NSString* dateString = [date description];
    if (date == nil) {
        dateString = @"-";
    }
    self.detailTextLabel.text = [NSString stringWithFormat:
                                 @"最後の更新: %@", dateString];
}


@end
