//
//  MTL_HistoryCellViewCell.h
//  Thai Lotto
//
//  Created by Maetee Lorprajuksiri on 6/17/12.
//  Copyright (c) 2012 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTL_HistoryCellViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *drawDateLabel;
@property (nonatomic, weak) IBOutlet UILabel *firstPriceLabel;
@property (nonatomic, weak) IBOutlet UILabel *threeNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *twoNumberLabel;

@end
