//
//  ListViewController.h
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/2/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *records;

@property (weak, nonatomic) IBOutlet UITableView *historyList;


@end
