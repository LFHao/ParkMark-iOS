//
//  ParkViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao  on 7/31/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "ParkViewController.h"
#import "MapViewController.h"

@interface ParkViewController ()
{
    PFFile *imageFile;
    NSString *noteContent;
    PFGeoPoint *point;
}

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
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
    }
}

/******************************************Take photo*****************************************************/

- (IBAction)takePhoto:(id)sender
{
    if(imageFile == nil) {
        [sender setTitle:@"Add Photo" forState:UIControlStateNormal];
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        // Delegate is self
        imagePicker.delegate = self;
        // Show image picker
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        imageFile = nil;
         NSLog(@"Photo delete");
        [sender setTitle:@"Add Photo" forState:UIControlStateNormal];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Access the uncropped image from info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // Dismiss controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(smallImage, 0.05f);
    imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    NSLog(@"Image got");
    [_photo setTitle:@"Delete Photo" forState:UIControlStateNormal];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [_photo setTitle:@"Add Photo" forState:UIControlStateNormal];
    
}

/******************************************END of take photo*****************************************************/


/********************************************Add note********************************************************/

- (IBAction)addNote:(id)sender
{
    if(noteContent == nil) {
        [sender setTitle:@"Add Note" forState:UIControlStateNormal];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Add Note"
                                                       message: @"Please enter your parking info here"
                                                      delegate: self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"Add", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField * alertTextField = [alert textFieldAtIndex:0];
        alertTextField.placeholder = @"5 floor, zone A, slot 304";
        [alert show];
    } else {
        noteContent = nil;
        NSLog(@"Note delete");
        [sender setTitle:@"Add Note" forState:UIControlStateNormal];
    }
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1) {
        noteContent = [[alertView textFieldAtIndex:0] text];
        NSLog(@"Note got");
        [_note setTitle:@"Delete Note" forState:UIControlStateNormal];
    }
}

/******************************************END of add note*****************************************************/


/******************************************Add location*******************************************************/

- (IBAction)addLocation:(id)sender
{
    if(point == nil) {
        [sender setTitle:@"Add Location" forState:UIControlStateNormal];
        [_locationManager startUpdatingLocation];
        point = [PFGeoPoint geoPointWithLatitude:_locationManager.location.coordinate.latitude
                                       longitude:_locationManager.location.coordinate.longitude];
        NSLog(@"Location got");
        [sender setTitle:@"Delete Location" forState:UIControlStateNormal];
        [self performSegueWithIdentifier:@"locationSegue" sender:self];
    } else {
        point = nil;
        NSLog(@"Location delete");
        [sender setTitle:@"Add Location" forState:UIControlStateNormal];
    }
}


/******************************************End of add location*******************************************************/



/******************************************Add alarm*******************************************************/
- (IBAction)addAlarm:(id)sender
{
    [self performSegueWithIdentifier:@"alarmSegue" sender:self];
}
/******************************************End of add alarm*******************************************************/




/******************************************Mark & Upload to Parse*******************************************************/


- (IBAction)mark:(id)sender
{
    PFObject *record = [PFObject objectWithClassName:@"ParkHistory"];
    if(noteContent != NULL) {
        record[@"note"] = noteContent;
        NSLog(@"Note is not null");
    } else {
        record[@"note"] = @"Ohoh, no note recorded.";
        NSLog(@"Note is null");
    }
    if(imageFile != nil) {
        record[@"image"] = imageFile;
        NSLog(@"Image is not null");
    } else {
        NSLog(@"Image is null");
    }
    
    if(point != nil) {
        record[@"geoLocation"] = point;
        NSLog(@"Location is not null");
    } else {
        NSLog(@"Location is null");
    }
    if(point != nil || noteContent != NULL || imageFile != nil) {
        record[@"status"] = @"n";
        [record saveInBackground];
    } else {
        NSLog(@"No objects in record");
    }
}


/******************************************End of mark*******************************************************/


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
