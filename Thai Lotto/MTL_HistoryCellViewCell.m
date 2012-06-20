//
//  MTL_HistoryCellViewCell.m
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/17/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import "MTL_HistoryCellViewCell.h"

@implementation MTL_HistoryCellViewCell
@synthesize drawDateLabel;
@synthesize firstPriceLabel;
@synthesize threeNumberLabel;
@synthesize twoNumberLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
