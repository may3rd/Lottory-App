//
//  MTL_SearchViewController.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/20/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_SearchViewController.h"
#import "MTL_CheckNumber.h"
#import "MTL_LotteryResult.h"

@interface MTL_SearchViewController ()

@end

@implementation MTL_SearchViewController
@synthesize selectedIndexPath;
@synthesize numberArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

// Override height of section heading
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)checkNumberAtIndex:(int)i
{
	MTL_CheckNumber * checkNumber = [numberArray objectAtIndex:i];
	MTL_LotteryResult * result = [[MTL_LotteryResult alloc] initWithDate:checkNumber.drawDate];
	checkNumber.result = [result checkNumber:checkNumber.number];
	checkNumber.checked = YES;
    
	// check if the number won price
	checkNumber.won = ([checkNumber.result length] > 0 ? YES : NO);
    
	// replace self.checkArray with checked result
	[numberArray removeObjectAtIndex:i];
	if (i >= [numberArray count])
	{
		[numberArray addObject:checkNumber];
	}
	else
	{
		[numberArray insertObject:checkNumber atIndex:i];
	}
}

-(void)checkNumberAll
{
	int n = [numberArray count];		// checkArray is NSMutableArray of MTL_CheckNumber
	for (int i = 0; i < n; i++)
	{
		[self checkNumberAtIndex:i];
	}	
}

#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString * title = [alertView buttonTitleAtIndex:buttonIndex];
	if ([title isEqualToString:@"Check now"])
	{
		[self checkNumberAtIndex:selectedIndexPath.row];
		[self.tableView reloadData];
	}
}

@end
