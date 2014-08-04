//
//  SocialViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/3/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "SocialViewController.h"
#import "ViewController.h"


@interface SocialViewController ()

@end

@implementation SocialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)done:(id)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([segue.identifier isEqualToString:@"rootSegue"]) {
//        ViewController *nextView = segue.destinationViewController;
//        //[nextView viewDidLoad];
//    }
//    NSLog(@"enter rootSegue");
//}




- (IBAction)checkIn:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbSheetOBJ setInitialText:@"Hey guys, I just arrived and parked my car! See you soon!"];
        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
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
