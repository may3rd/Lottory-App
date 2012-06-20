//
//  MTL_SearchViewController.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/20/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTL_SearchViewController : UITableViewController <UIAlertViewDelegate>
{
    NSIndexPath * selectedIndexPath;
    NSMutableArray * numberArray;
}

@property (nonatomic, strong) NSIndexPath * selectedIndexPath;
@property (nonatomic, strong) NSMutableArray * numberArray;

@end
