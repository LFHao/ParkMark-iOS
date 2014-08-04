//
//  ViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 7/26/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
@interface ViewController ()
{
     NSMutableArray *records;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    


}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //Retrive data from parse
    records = [[NSMutableArray alloc]init];
    PFQuery *query = [PFQuery queryWithClassName:@"ParkHistory"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu records.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                [records addObject:object];
                NSLog(@"%@", object[@"note"]);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"findSegue"]) {
        ListViewController *nextView = segue.destinationViewController;
        nextView.records = records;
    }
    NSLog(@"enter segue");
}



@end
