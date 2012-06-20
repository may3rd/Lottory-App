//
//  MTL_LotteryResult.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/17/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_LotteryResult.h"

NSString *const kXMLReaderTextNodeKey = @"text";

@implementation MTL_LotteryResult

@synthesize date;
@synthesize drawDate;
@synthesize firstPrice;
@synthesize firstNextPrice;
@synthesize secondPrice;
@synthesize thirdPrice;
@synthesize forthPrice;
@synthesize fifthPrice;
@synthesize threeNumberPrice;
@synthesize twoNumberPrice;

- (id)initWithDate:(NSDate *)date_
{
    if (!(self = [super init])) {
        return nil;
    }
    
    date = date_;
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"th_TH"]];
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:date] intValue];
        
    [dateFormatter setDateFormat:@"MM"];
    int month = [[dateFormatter stringFromDate:date] intValue];
        
    [dateFormatter setDateFormat:@"dd"];
    int day = [[dateFormatter stringFromDate:date] intValue];
        
    NSString * urlString = [NSString stringWithFormat:@"http://www.glo.or.th/detail.php?link=result_text&select_round=%04d%02d%02d", year, month, day];
    
    // get data from url
    NSURL * url = [[NSURL alloc] initWithString:urlString];
    NSData * data = [[NSData alloc] initWithContentsOfURL:url];
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    self.firstPrice = [self firstPriceFromString:string];
    self.firstNextPrice = [self firstNextPriceFromString:string];
    self.secondPrice = [self secondPriceFromString:string];
    self.thirdPrice = [self thirdPriceFromString:string];
    self.forthPrice = [self forthPriceFromString:string];
    self.fifthPrice = [self fifthPriceFromString:string];
    self.threeNumberPrice = [self threeNumberFromString:string];
    self.twoNumberPrice = [self twoNumberFromString:string];
    
    [dateFormatter setDateFormat:@"d MMMM yyyy"];
    self.drawDate = [NSString stringWithFormat:@"งวดประจำวันที่ %@", [dateFormatter stringFromDate:date]];
    
    return self;
}

-(id)initWithDate:(NSDate *)date_ drawDate:(NSString *)drawDate_ firstPrice:(NSString *)firstPrice_ firstNext:(NSString *)firstNext_ secondPrice:(NSString *)secondPrice_ thirdPrice:(NSString *)thirdPrice_ forthPrice:(NSString *)forthPrice_ fifthPrice:(NSString *)fifthPrice_ threeNumber:(NSString *)threeNumber_ twoNumber:(NSString *)twoNumber_
{
	self = [super init];
	if (self)
	{
		date = date_;
        drawDate = drawDate_;
		firstPrice = firstPrice_;
        firstNextPrice = firstNext_;
        secondPrice = secondPrice_;
        thirdPrice = thirdPrice_;
        forthPrice = forthPrice_;
        fifthPrice = fifthPrice_;
        threeNumberPrice = threeNumber_;
        twoNumberPrice = twoNumber_;
	}
    
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	MTL_LotteryResult * copy = [[[self class] allocWithZone:zone] initWithDate:date drawDate:drawDate firstPrice:firstPrice firstNext:firstNextPrice secondPrice:secondPrice thirdPrice:thirdPrice forthPrice:forthPrice fifthPrice:fifthPrice threeNumber:threeNumberPrice twoNumber:twoNumberPrice];
	
    return copy;
    
}

-(NSString *)stringFromDrawDate
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"th_TH"]];
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:date] intValue];
    
    [dateFormatter setDateFormat:@"MM"];
    int month = [[dateFormatter stringFromDate:date] intValue];
    
    [dateFormatter setDateFormat:@"dd"];
    int day = [[dateFormatter stringFromDate:date] intValue];
    
	return [NSString stringWithFormat:@"%04d%02d%02d", year, month, day];
}

-(NSString *)checkNumber:(NSString *)number
{
	NSString * stringToReturn = @"";
	
    stringToReturn = [self checkForPrice:number forPrice:self.firstPrice withDigit:6 ofNumber:1 returnString:@"You won FIRST PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.firstNextPrice withDigit:6 ofNumber:2 returnString:@"You won NEXT TO FIRST PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.secondPrice withDigit:6 ofNumber:5 returnString:@"You won SECOND PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.thirdPrice withDigit:6 ofNumber:10 returnString:@"You won THIRD PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.forthPrice withDigit:6 ofNumber:50 returnString:@"You won FORTH PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.fifthPrice withDigit:6 ofNumber:100 returnString:@"You won FIFTH PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.threeNumberPrice withDigit:3 ofNumber:4 returnString:@"You won THREE NUMBER PRICE." originalString:stringToReturn];
    stringToReturn = [self checkForPrice:number forPrice:self.twoNumberPrice withDigit:2 ofNumber:1 returnString:@"You won TWO NUMBER PRICE." originalString:stringToReturn];
    if ([stringToReturn length] > 0) {
        return stringToReturn;
    }
    else {
        return @"This number is not won any price.";
    }
}

-(NSString *)checkForPrice:(NSString *)number forPrice:(NSString *)price withDigit:(int)digit ofNumber:(int)n returnString:(NSString *)returnString originalString:(NSString *)orgString
{
	NSString * string = [self check:number forPrice:price withDigit:digit ofNumber:n returnString:returnString];
	if (orgString.length > 0)
	{
		if (string.length > 0)
		{
			return [orgString stringByAppendingFormat:@"\n%@", string];
		}
		else
		{
			return orgString;
		}
	}
	else
	{
		return string;
	}
}

-(NSString *)check:(NSString *)number forPrice:(NSString *)price withDigit:(int)digit ofNumber:(int)n returnString:(NSString *)returnString
{
    if (digit < 6)
    {
        number = [number substringFromIndex:[number length] - digit];
    }
    for (int i = 0; i < n; i++)
    {
        NSString * wonString = [price substringWithRange:NSMakeRange(i*(digit + 1), digit)];
        if ([number isEqualToString:wonString])
        {
            return returnString;
        }
    }
    return nil;
}

- (NSString *) firstPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi1.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) firstNextPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/w1_1.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) secondPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi2.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) thirdPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi3.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) forthPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi4.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) fifthPriceFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi5.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) threeNumberFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi6.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) twoNumberFromString:(NSString *)string
{
    NSRange range = [string rangeOfString:@"images/wi7.gif"];
    NSString * tempString = [string substringFromIndex:(range.location + range.length)];
    
    range = [tempString rangeOfString:@"</font>"];
    tempString = [tempString substringToIndex:range.location];
    
    range = [tempString rangeOfString:@"Arial"];
    tempString = [tempString substringFromIndex:range.location+range.length+2];
    
    return [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)createHTML
{
    NSString * htmlString = [NSString stringWithFormat:@"<html><body><font face=Arial><h2 align=center>%@</h2><p align=center><strong>รางวัลที่ 1 มี 1 รางวัล</strong><br>%@</p><p align=center><strong>ข้างเคียงรางวัลที่ 1 มี 2 รางวัล</strong><br>%@</p><p align=center><strong>เลขท้าย 3 ตัว หมุน 4 ครั้ง</strong><br>%@</p><p align=center><strong>เลขท้าย 2 ตัว หมุน 1 ครั้ง<strong></br>%@</p><p align=center><strong>รางวัลที่ 2 มี 5 รางวัล</strong><br>%@</p><p align=center><strong>รางวัลที่ 3 มี 10 รางวัล</strong><br>%@</p><p align=center><strong>รางวัลที่ 4 มี 50 รางวัล</strong><br>%@</p><p align=center><strong>รางวัลที่ 5 มี 100 รางวัล</strong><br>%@</p><p align=center>กรุณาตรวจสอบรางวัลอีกครั้งกับทางสำนักงานสลากกินแบ่งรัฐบาล ขอบคุณ</p></font></body></html>", drawDate, firstPrice, firstNextPrice, threeNumberPrice, twoNumberPrice, secondPrice, thirdPrice, forthPrice, fifthPrice];
    
    return htmlString;
}

@end
