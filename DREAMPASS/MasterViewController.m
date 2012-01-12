//
//  MasterViewController.m
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PlayViewController.h"

@implementation MasterViewController
@synthesize realView;
@synthesize virtualView;
@synthesize masterScrollView;
@synthesize appTableView;
@synthesize appTableCell;
@synthesize searchView;
@synthesize likeSortButton;
@synthesize friendsSortButton;
@synthesize pvSortButton;
@synthesize freeWordTextField;
@synthesize categoryButton;
@synthesize freeButton;
@synthesize saleButton;
@synthesize submitButton;
@synthesize eventArray;
@synthesize _pageIndex;

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.eventArray = [NSMutableArray array];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.5 green:0 blue:0 alpha:1.0]];
}

- (void)communicateWithServer:(int)pageIndex
{
    __block NSDictionary *resultDict;
    
    void (^onSuccess)(NSData *) = ^(NSData *data) {
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        resultDict = [resultString JSONValue];
        [self.eventArray addObjectsFromArray:[resultDict objectForKey:@"event"]];
        
        [self _taskFinished:self];
        [self.appTableView reloadData];
    };
    void (^onError)(NSError *) = ^(NSError *error) {
        NSLog(@"hoge failed");
        
        [self _taskFinished:self];
        [self.appTableView reloadData];
    };
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d",HOST_URL,@"neworder/",pageIndex]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [HttpClient request:request success:onSuccess error:onError];
}

- (void)communicationFinished
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [self set_pageIndex:1];
    [self communicateWithServer:self._pageIndex];
    
    [super viewWillAppear:animated];
    
    
    self.virtualView.backgroundColor = [UIColor colorWithRed:0.545 green:0.000 blue:0.000 alpha:1.0];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem3 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem4 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage 
                                                        highlightedContentImage:nil];
    QuadCurveMenuItem *starMenuItem5 = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed 
                                                                   ContentImage:starImage
                                                        highlightedContentImage:nil];
    
    //NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, starMenuItem7,starMenuItem8,starMenuItem9, nil];
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];
    
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:CGRectMake(0,0,100,100) menus:menus];
	
    menu.delegate = self;
    [self.view addSubview:menu];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    isSearchSelected = FALSE;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.eventArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AppTableCell";
    
    AppTableCell *cell = (AppTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"AppTableCell" owner:self options:nil];
        cell = appTableCell;
    }
    
    cell.titleLabel.text = [[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"movie"] objectForKey:@"title"];
    cell.placeLabel.text = [[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"theater"] objectForKey:@"name"];
    cell.begintimeLabel.text = [[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"shift"] objectForKey:@"start"];
    cell.endtimeLabel.text = [[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"shift"] objectForKey:@"end"];
    if ([[[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"purchase"] objectForKey:@"status"] boolValue]) {
        cell.dealtLabel.text = @"成立";
    } else {
        cell.dealtLabel.text = @"未成立";
    }
    
    NSString *urlString = [[[self.eventArray objectAtIndex:indexPath.row] objectForKey:@"movie"] objectForKey:@"image"];
    [cell.lazyImageView startLoadImage:[NSURL URLWithString:urlString]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	cell.backgroundColor = [UIColor colorWithRed:0.545 green:0.000 blue:0.000 alpha:1.0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 380;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self pushMoviePage];
}

- (IBAction)leftBarButtonItemPressed:(id)sender
{
    if (isSearchSelected == TRUE) {
        isSearchSelected = FALSE;
        [self openSearchView:-200];
    } else {
        isSearchSelected = TRUE;
        [self openSearchView:200];
    }
}

- (void)openSearchView:(int)scrollLength
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5]; // if you want to slide up the view
    
    CGRect rect = self.virtualView.frame;
    
    rect.origin.y += scrollLength;
    
    self.virtualView.frame = rect;
    
    [UIView commitAnimations];
}

- (void)pushMoviePage
{
    PlayViewController *playViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayView"];
    [self.navigationController pushViewController:playViewController animated:YES];
}

- (void)pushDetailPage
{
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (IBAction)searchButtonPressed:(id)sender
{
    //NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:HOST_URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /*
     * footer
     */
    if (self.appTableView.footerView.state == FooterViewStateStopping) {
        return;
    }
    
    CGFloat thresholdA = scrollView.contentSize.height + 15.0f - self.appTableView.frame.size.height;
    CGFloat thresholdB = scrollView.contentSize.height + self.appTableView.footerView.frame.size.height - self.appTableView.frame.size.height;
    
    if (thresholdA <= scrollView.contentOffset.y &&
        scrollView.contentOffset.y < thresholdB) {
        self.appTableView.footerView.state = FooterViewStatePullingDown;
        
    } else if (thresholdB < scrollView.contentOffset.y ) {
        self.appTableView.footerView.state = FooterViewStateOveredThreshold;
        
    } else {
        self.appTableView.footerView.state = FooterViewStateHidden;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    /*
     * footer
     */
    if (self.appTableView.footerView.state == FooterViewStateOveredThreshold) {
        [self.realView setUserInteractionEnabled:NO];
        
        self.appTableView.footerView.state = FooterViewStateStopping;
        [self.appTableView _setFooterViewHidden:NO animated:YES];
        
        self._pageIndex++;
        [self communicateWithServer:self._pageIndex];
    }
}

- (void)_taskFinished:(MasterViewController *)masterViewController
{
    masterViewController.appTableView.footerView.state = FooterViewStateHidden;
    [masterViewController.appTableView.footerView setUpdatedDate:[NSDate date]];
    [masterViewController.appTableView _setFooterViewHidden:YES animated:YES];
    
    [masterViewController.realView setUserInteractionEnabled:YES];
}

@end
