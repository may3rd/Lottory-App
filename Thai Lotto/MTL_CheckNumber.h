//
//  MTL_CheckNumber.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/20/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTL_CheckNumber : NSObject <UIAlertViewDelegate>

{
	NSString * number;
	NSDate * drawDate;
	BOOL checked;
	BOOL won;
	NSString * result;
}

@property (nonatomic, strong) NSString * number;
@property (nonatomic, strong) NSDate * drawDate;
@property (nonatomic, strong) NSString * result;
@property BOOL checked;
@property BOOL won;

@end
