//
//  MTL_dateList.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/14/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_dateList.h"

@implementation MTL_dateList
@synthesize dateList = _dateList;

- (int) count
{
    return [self.dateList count];
}

- (NSDate *) objectAtIndex:(int)index
{
    return [self.dateList objectAtIndex:index];
}

- (void) initWithCount:(int)dateCount
{
    self.dateList = [[NSMutableArray alloc] init];
    NSDate * Date = [[NSDate alloc] init];
    NSString * dateString = [[NSString alloc] init];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    [dateFormatter setDateFormat:@"MM"];
    int month = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    [dateFormatter setDateFormat:@"dd"];
    int day = [[dateFormatter stringFromDate:[NSDate date]] intValue];
    
    day = ( day > 16 ? 16 : 1 );
    
    int i;
    for (i=0; i < dateCount; i++)
    {
        dateString = [NSString stringWithFormat:@"%04d-%02d-%02d 00:00:00",year,month,day];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        Date = [dateFormatter dateFromString:dateString];
        
        [_dateList insertObject:Date atIndex:[_dateList count]];
        
        if (day == 1 || day == 2 || day == 30)
        {
            if (day == 30) { month++; }
            day = 16;
            month--;
            
            if (month < 1)
            {
                month = 12;
                year = year - 1;
            }
        }
        else 
        {
            day = 1;
            if (month == 5)
            {
                day = 2;
            }
            else if (month == 1)
            {
                day = 30;
                month = 12;
                year = year - 1;
            }
        }
    }
}

-(void) addDateCount:(int)n
{
    if ([self.dateList count] == 0) {
        [self initWithCount:n];
        return;
    }
    
    NSDate * date = [self.dateList lastObject];
    NSString * dateString = [[NSString alloc] init];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:date] intValue];
    
    [dateFormatter setDateFormat:@"MM"];
    int month = [[dateFormatter stringFromDate:date] intValue];
    
    [dateFormatter setDateFormat:@"dd"];
    int day = [[dateFormatter stringFromDate:date] intValue];
    
    int i;
    for (i=0; i < n; i++)
    {
        if (day == 1 || day == 2 || day == 30)
        {
            if (day == 30) { month++; }
            day = 16;
            month--;
            
            if (month < 1)
            {
                month = 12;
                year = year - 1;
            }
        }
        else 
        {
            day = 1;
            if (month == 5)
            {
                day = 2;
            }
            else if (month == 1)
            {
                day = 30;
                month = 12;
                year = year - 1;
            }
        }
        
        dateString = [NSString stringWithFormat:@"%04d-%02d-%02d 00:00:00",year,month,day];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        date = [dateFormatter dateFromString:dateString];
        
        [_dateList insertObject:date atIndex:[_dateList count]];
    }
}

@end
