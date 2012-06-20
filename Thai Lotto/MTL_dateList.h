//
//  MTL_dateList.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/14/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTL_dateList : NSObject
{
    NSMutableArray * dateList;
}

@property (strong, nonatomic) NSMutableArray * dateList;

- (int) count;
- (NSDate *) objectAtIndex:(int)index;
- (void) initWithCount:(int)dateCount;
- (void) addDateCount:(int)n;

@end
