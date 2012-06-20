//
//  SpinnerView.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/19/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpinnerView : UIView

+(SpinnerView *)loadSpinnerIntoView:(UIView *)superView;
-(void)removeSpinner;

@end
