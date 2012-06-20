//
//  MTL_CurrentDrawViewController.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/19/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_CurrentDrawViewController.h"
#import "MTL_LotteryResult.h"
#import "MTL_dateList.h"

@interface MTL_CurrentDrawViewController ()

@end

@implementation MTL_CurrentDrawViewController

@synthesize result;
@synthesize date;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    NSString * string = [result checkNumber:@"000547"];
    NSLog(@"%@", string);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
    [webView loadHTMLString:[result createHTML] baseURL:nil];
}

- (IBAction)closeModalView:(id)sender {
    if(self.parentViewController)
    {
        //pre-ios5
        [self.parentViewController dismissModalViewControllerAnimated:YES];
    }
    else
    {
        [self.presentingViewController dismissModalViewControllerAnimated:YES];
    }
}
@end
