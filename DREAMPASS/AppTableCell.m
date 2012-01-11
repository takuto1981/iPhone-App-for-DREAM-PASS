//
//  AppTableCell.m
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "AppTableCell.h"
#import "PlayViewController.h"
#import "DetailViewController.h"

@implementation AppTableCell
@synthesize delegate;
@synthesize imageButton;
@synthesize titleLabel;
@synthesize placeLabel;
@synthesize begintimeLabel;
@synthesize endtimeLabel;
@synthesize dealtLabel;
@synthesize lazyImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)moviePageButtonPressed:(id)sender
{
    [delegate pushMoviePage];
}

- (IBAction)detailPageButtonPressed:(id)sender;
{
    [delegate pushDetailPage];
}

@end
