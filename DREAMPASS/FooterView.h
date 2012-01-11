//
//  FooterView.h
//  CustomCellSample
//
//  Created by Hiroshi Hashiguchi on 11/07/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    FooterViewStateHidden = 0,
    FooterViewStatePullingDown,
    FooterViewStateOveredThreshold,
    FooterViewStateStopping
} FooterViewState;

@interface FooterView : UIView {
    
}

@property (nonatomic, retain) IBOutlet UILabel* textLabel;
@property (nonatomic, retain) IBOutlet UILabel* detailTextLabel;
@property (nonatomic, retain) IBOutlet UIImageView* imageView; 
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView* activityIndicatorView;
@property (nonatomic, retain) IBOutlet UIView *footerView;

@property (nonatomic, assign) FooterViewState state;

- (void)setUpdatedDate:(NSDate*)date;

@end
