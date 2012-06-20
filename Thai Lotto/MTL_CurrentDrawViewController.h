//
//  MTL_CurrentDrawViewController.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/19/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTL_LotteryResult.h"

@interface MTL_CurrentDrawViewController : UIViewController
{
    MTL_LotteryResult * result;
    NSDate * date;
    IBOutlet UIWebView * webView;
}

@property (strong, nonatomic) MTL_LotteryResult * result;
@property (strong, nonatomic) NSDate * date;
- (IBAction)closeModalView:(id)sender;

@end
