//
//  MTL_LotteryResult.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/17/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTL_LotteryResult : NSObject <NSXMLParserDelegate> {
    NSDate * date;
    NSString * drawDate;
    NSString * firstPrice;
    NSString * firstNextPrice;
    NSString * secondPrice;
    NSString * thirdPrice;
    NSString * forthPrice;
    NSString * fifthPrice;
    NSString * threeNumberPrice;
    NSString * twoNumberPrice;
}

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSString * drawDate;
@property (nonatomic, strong) NSString * firstPrice;
@property (nonatomic, strong) NSString * firstNextPrice;
@property (nonatomic, strong) NSString * secondPrice;
@property (nonatomic, strong) NSString * thirdPrice;
@property (nonatomic, strong) NSString * forthPrice;
@property (nonatomic, strong) NSString * fifthPrice;
@property (nonatomic, strong) NSString * threeNumberPrice;
@property (nonatomic, strong) NSString * twoNumberPrice;

-(id)initWithDate:(NSDate *)date;
-(id)initWithDate:(NSDate *)date_ drawDate:(NSString *)drawDate_ firstPrice:(NSString *)firstPrice_ firstNext:(NSString *)firstNext_ secondPrice:(NSString *)secondPrice_ thirdPrice:(NSString *)thirdPrice_ forthPrice:(NSString *)forthPrice_ fifthPrice:(NSString *)fifthPrice_ threeNumber:(NSString *)threeNumber_ twoNumber:(NSString *)twoNumber_;
-(NSString *)checkNumber:(NSString *)number;
-(NSString *)stringFromDrawDate;
-(NSString *)checkForPrice:(NSString *)number forPrice:(NSString *)price withDigit:(int)digit ofNumber:(int)n returnString:(NSString *)returnString originalString:(NSString *)orgString;
-(NSString *)check:(NSString *)number forPrice:(NSString *)price withDigit:(int)digit ofNumber:(int)n returnString:(NSString *)returnString;
-(NSString *)createHTML;

@end