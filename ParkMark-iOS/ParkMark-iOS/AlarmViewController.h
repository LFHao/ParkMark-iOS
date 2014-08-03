//
//  AlarmViewController.h
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/1/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController

- (IBAction)add:(id)sender;

- (IBAction)cancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datapicker;

@end
