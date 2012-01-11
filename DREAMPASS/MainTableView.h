//
//  MainTableView.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FooterView.h"

@interface MainTableView : UITableView

@property (nonatomic,retain) IBOutlet FooterView *footerView;

- (void)_setFooterViewHidden:(BOOL)hidden animated:(BOOL)animated;

@end
