//
//  MTL_HistoryViewController.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/13/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_HistoryViewController.h"
#import "MTL_CurrentDrawViewController.h"
#import "MTL_LotteryResult.h"
#import "MTL_dateList.h"
#import "SpinnerView.h"

@interface MTL_HistoryViewController ()

@end

@implementation MTL_HistoryViewController

@synthesize dateList = _dateList;
@synthesize resultArray = _resultArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    
        alertView = [[UIAlertView alloc] initWithTitle:@"Loading data"
                                               message:@"\n"
                                              delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil];
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];   
        spinner.center = CGPointMake(139.5, 75.5); // .5 so it doesn't blur
        [alertView addSubview:spinner];
        [spinner startAnimating];
        
        [self.view addSubview:alertView];
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
    
    dateList = [[MTL_dateList alloc] init];
    //[dateList addDateCount:1];
    
    // create results array
    int i;
    resultArray = [[NSMutableArray alloc] init];
     
    for (i = 0; i < [dateList count]; i++) {
        MTL_LotteryResult * result = [[MTL_LotteryResult alloc] initWithDate:[dateList objectAtIndex:i]];
        [resultArray addObject:result];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [resultArray count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [resultArray count]) {
        static NSString *CellIdentifier = @"HistoryCell";
        MTL_HistoryCellViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
        // Configure the cell...
        MTL_LotteryResult * result = [resultArray objectAtIndex:indexPath.row];
    
        cell.drawDateLabel.text = result.drawDate;
        cell.firstPriceLabel.text = [[NSString alloc] initWithFormat:@"รางวัลที่ 1 %@", result.firstPrice];
        cell.threeNumberLabel.text = [[NSString alloc] initWithFormat:@"เลขท้าย 3 ตัว %@", result.threeNumberPrice];
        cell.twoNumberLabel.text = [[NSString alloc] initWithFormat:@"เลขท้าย 2 ตัว %@", result.twoNumberPrice];
        
        return cell;
    }
    else {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.textLabel.text = [NSString stringWithFormat:@"Load more data..."];
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [resultArray count])
    {
        return 44.0;
    }
    
    return 107.0;
}

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
    
    if (indexPath.row == [resultArray count])
    {
        NSLog(@"Load more data");
        
        int n = [dateList count];
        int i;
        
        [dateList addDateCount:5];
        
        for (i = n; i < [dateList count]; i++) {
            MTL_LotteryResult * result = [[MTL_LotteryResult alloc] initWithDate:[dateList objectAtIndex:i]];
            [resultArray addObject:result];
        }
        
        [tableView reloadData];
        
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"HistoryDetail"])
    {
        MTL_CurrentDrawViewController * destinationView = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        if (myIndexPath.row < [dateList count])
        {
            //NSLog(@"%@", [dateList objectAtIndex:myIndexPath.row]);
            [destinationView setDate:[dateList objectAtIndex:myIndexPath.row]];
            destinationView.result = [[resultArray objectAtIndex:myIndexPath.row] copy];
        }
    }
}

@end
