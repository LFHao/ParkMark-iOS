//
//  ParkViewController.m
//  ParkMark-iOS
//
//  Created by Leif on 7/31/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "ParkViewController.h"

@interface ParkViewController ()

@end

@implementation ParkViewController


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
    // Do any additional setup after loading the view.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(UIButton *)sender
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)addNote:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Add Note"
                                                   message: @"Please enter your parking info here"
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Add", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.placeholder = @"5 floor, zone A, slot 304";
    [alert show];
}

//- (IBAction)addAlarm:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Add Note"
//                                                   message: @"Please enter your parking info here"
//                                                  delegate: self
//                                         cancelButtonTitle:@"Cancel"
//                                         otherButtonTitles:@"Add", nil];
//    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
//    
//    // create a UIPicker view as a custom keyboard view
//    UIPickerView* pickerView = [[UIPickerView alloc] init];
//    [pickerView sizeToFit];
//    pickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//    pickerView.delegate = self;
//    pickerView.dataSource = self;
//    pickerView.showsSelectionIndicator = YES;
//    
//    UITextField * alertTextField = [alert textFieldAtIndex:0];
//    alertTextField.inputView = pickerView;
//    
//    [alert show];
//    
//}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
}



//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    imageView.image = chosenImage;
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
