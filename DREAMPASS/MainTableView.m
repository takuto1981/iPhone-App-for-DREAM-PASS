//
//  MainTableView.m
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainTableView.h"

@implementation MainTableView
@synthesize footerView;

- (void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"MainTableView" owner:self options:nil];
    self.tableFooterView = self.footerView;
    
    self.backgroundColor = [UIColor colorWithRed:0.545 green:0.000 blue:0.000 alpha:1.0];
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)_setFooterViewHidden:(BOOL)hidden animated:(BOOL)animated
{
    CGFloat bottomOffset = 0.0;
    if (!hidden) {
        bottomOffset = self.footerView.frame.size.height;
    }
    if (animated) {
        [UIView animateWithDuration:0.1
                         animations:^{
                             self.contentInset = UIEdgeInsetsMake(0, 0, bottomOffset, 0);
                         }];
    } else {
        self.contentInset = UIEdgeInsetsMake(0, 0, bottomOffset, 0);        
    }
}

@end
