//
//  ListViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/2/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "ListViewController.h"
#import "DirecationViewController.h"
#import "CellTableViewCell.h"


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
    return [_records count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ListCell";
    
    CellTableViewCell *cell = (CellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    PFObject *cur = [_records objectAtIndex:indexPath.row];
    cell.note.text = [cur objectForKey:@"note"];
    
    PFFile *theImage = [cur objectForKey:@"image"];
    NSData *imageData = [theImage getData];
    cell.image.image = [UIImage imageWithData:imageData];
    
    NSString *status = [cur objectForKey:@"status"];
    if([status isEqualToString:@"marked"]) {
        cell.status.text = @"Marked";
    } else {
        cell.status.text = @"Picked";
    }
   
    NSDate *createdAt = cur.createdAt;
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"MM/dd/yyyy";
    NSString* dateString = [df stringFromDate:createdAt];
    cell.date.text = dateString;
    NSLog(dateString);
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Select a row");
    selectedRecord = [_records objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"direcationSegue" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"direcationSegue"]) {
        
        DirecationViewController *nextView = segue.destinationViewController;
        nextView.record = selectedRecord;
        NSLog(@"Pass data");
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
