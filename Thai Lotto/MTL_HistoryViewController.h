//
//  MTL_HistoryViewController.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/13/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTL_dateList.h"
#import "MTL_HistoryCellViewCell.h"

@interface MTL_HistoryViewController : UITableViewController
{
    MTL_dateList * dateList;
    NSMutableArray * resultArray;
    UIAlertView * alertView;
}

@property (strong, nonatomic) MTL_dateList * dateList;
@property (strong, nonatomic) NSMutableArray * resultArray;

@end
