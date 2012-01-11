//
//  PlayViewController.m
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PlayViewController.h"
#import "HttpClient.h"

@implementation PlayViewController
@synthesize masterPageButton;
@synthesize detailPageButton;
@synthesize playLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    void (^onSuccess)(NSData *) = ^(NSData *data) {
        NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary *resultDict = [resultString JSONValue];
        NSLog(@"%@", resultDict);
    };
    void (^onError)(NSError *) = ^(NSError *error) {
        NSLog(@"hoge failed");
    };
    NSURL *url = [NSURL URLWithString:@"http://176.34.20.70:8000/neworder/01"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [HttpClient request:request success:onSuccess error:onError];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
