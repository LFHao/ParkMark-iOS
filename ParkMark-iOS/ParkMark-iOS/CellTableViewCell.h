//
//  CellTableViewCell.h
//  ParkMark-iOS
//
//  Created by Leif on 8/3/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) IBOutlet UILabel *note;

@property (strong, nonatomic) IBOutlet UILabel *status;

@property (strong, nonatomic) IBOutlet UILabel *date;

@end
