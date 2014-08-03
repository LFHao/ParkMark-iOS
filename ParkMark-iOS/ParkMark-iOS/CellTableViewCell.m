//
//  CellTableViewCell.m
//  ParkMark-iOS
//
//  Created by Leif on 8/3/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "CellTableViewCell.h"

@implementation CellTableViewCell

@synthesize note = _note;
@synthesize image = _image;
@synthesize status = _status;
@synthesize date = _date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
