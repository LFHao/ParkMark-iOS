//
//  SocialViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/3/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "SocialViewController.h"
#import <Social/Social.h>
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
    [self.navigationController popViewControllerAnimated:YES];
}

//- (IBAction)facebook:(id)sender {
//    
//    
//    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
//        SLComposeViewController *fbSheetOBJ = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//        
//        [fbSheetOBJ setInitialText:@"First post from my iOS application in weblineindia"];
//        [self presentViewController:fbSheetOBJ animated:YES completion:Nil];
//    }
//}

- (IBAction)facebook:(id)sender {
    [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error){
        //code user has loged in
    }];
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
