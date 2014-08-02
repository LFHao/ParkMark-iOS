//
//  ListViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/2/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "ListViewController.h"
#import "DirecationViewController.h"


@interface ListViewController ()
{
    PFObject *selectedRecord;
}

@end

@implementation ListViewController

@synthesize historyList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Enter counter");
    return _records.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ListCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_records objectAtIndex:indexPath.row][@"note"];
    
    PFFile *theImage = [_records objectAtIndex:indexPath.row][@"image"];
    NSData *imageData = [theImage getData];
    cell.imageView.image = [UIImage imageWithData:imageData];
    
    NSLog(@"Generate cell");
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select a row");
    selectedRecord = [_records objectAtIndex:indexPath.row];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detailSegue"]) {
        DirecationViewController *nextView = segue.destinationViewController;
        nextView.selectedRecord = selectedRecord;
    }
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
