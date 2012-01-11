//
//  AppTableCell.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LazyImageView.h"

@protocol appTableCellDelegate<NSObject>
- (void)pushMoviePage;
- (void)pushDetailPage;
@end

@interface AppTableCell : UITableViewCell

@property (nonatomic,retain) IBOutlet UIButton *imageButton;
@property (nonatomic,retain) IBOutlet UILabel *titleLabel;
@property (nonatomic,retain) IBOutlet UILabel *placeLabel;
@property (nonatomic,retain) IBOutlet UILabel *begintimeLabel;
@property (nonatomic,retain) IBOutlet UILabel *endtimeLabel;
@property (nonatomic,retain) IBOutlet UILabel *dealtLabel;
@property (nonatomic,retain) IBOutlet LazyImageView *lazyImageView;

@property (nonatomic,assign) NSObject<appTableCellDelegate> *delegate;

- (IBAction)moviePageButtonPressed:(id)sender;
- (IBAction)detailPageButtonPressed:(id)sender;

@end
