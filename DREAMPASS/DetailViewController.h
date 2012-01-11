//
//  DetailViewController.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic,retain) IBOutlet UIImage *appIconImage;
@property (nonatomic,retain) IBOutlet UIButton *playMovieButton;
@property (nonatomic,retain) IBOutlet UIButton *buyButton;
@property (nonatomic,retain) IBOutlet UIButton *favouriteButton;
@property (nonatomic,retain) IBOutlet UIButton *commentPageButton;
@property (nonatomic,retain) IBOutlet UIButton *likePageButton;
@property (nonatomic,retain) IBOutlet UIButton *devPageButton;
@property (nonatomic,retain) IBOutlet UIButton *sharePageButton;
@property (nonatomic,retain) IBOutlet UIButton *commentButton;

@end
