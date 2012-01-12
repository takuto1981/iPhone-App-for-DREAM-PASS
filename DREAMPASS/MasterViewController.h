//
//  MasterViewController.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTableView.h"
#import "AppTableCell.h"
#import "HttpClient.h"

@interface MasterViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    BOOL isSearchSelected;
}

@property (nonatomic,retain) IBOutlet UIView *realView;
@property (nonatomic,retain) IBOutlet UIView *virtualView;

@property (nonatomic,retain) IBOutlet UIScrollView *masterScrollView;
@property (nonatomic,retain) IBOutlet MainTableView *appTableView;
@property (nonatomic,retain) IBOutlet AppTableCell *appTableCell;
@property (nonatomic,retain) IBOutlet UIView *searchView;
@property (nonatomic,retain) IBOutlet UIButton *likeSortButton;
@property (nonatomic,retain) IBOutlet UIButton *friendsSortButton;
@property (nonatomic,retain) IBOutlet UIButton *pvSortButton;

@property (nonatomic,retain) IBOutlet UITextField *freeWordTextField;
@property (nonatomic,retain) IBOutlet UIButton *categoryButton;
@property (nonatomic,retain) IBOutlet UIButton *freeButton;
@property (nonatomic,retain) IBOutlet UIButton *saleButton;
@property (nonatomic,retain) IBOutlet UIButton *submitButton;

@property int _pageIndex;

@property (nonatomic,retain) NSMutableArray *eventArray;

- (IBAction)leftBarButtonItemPressed:(id)sender;
- (void)openSearchView:(int)scrollLength;
- (IBAction)searchButtonPressed:(id)sender;
- (void)_taskFinished:(MasterViewController *)masterViewController;
- (void)communicateWithServer:(int)pageIndex;
- (void)pushMoviePage;

@end
