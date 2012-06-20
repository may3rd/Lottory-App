//
//  SpinnerView.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/19/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "SpinnerView.h"

@implementation SpinnerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(SpinnerView *)loadSpinnerIntoView:(UIView *)superView
{
    // Create a new view with the same frame size as the superView
    SpinnerView *spinnerView = [[SpinnerView alloc] initWithFrame:superView.bounds];
    
    // If something's gone wrong, abort
    if (!spinnerView) {
        return nil;
    }
    
    // Just to show we have done something, let's make the background black
    spinnerView.backgroundColor = [UIColor blackColor];
    [superView addSubview:spinnerView];
    
    return spinnerView;
}

-(void)removeSpinner
{
    [super removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
