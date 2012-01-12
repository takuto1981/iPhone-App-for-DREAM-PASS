//
//  PlayViewController.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "QuadCurveMenu.h"

@interface PlayViewController : UIViewController<QuadCurveMenuDelegate>

@property (nonatomic,retain) IBOutlet UIButton *masterPageButton;
@property (nonatomic,retain) IBOutlet UIButton *detailPageButton;

@property (nonatomic,retain) IBOutlet UILabel *playLabel;

@end
