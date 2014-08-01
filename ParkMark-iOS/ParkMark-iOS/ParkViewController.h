//
//  ParkViewController.h
//  ParkMark-iOS
//
//  Created by Leif on 7/31/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"
#import <MapKit/MapKit.h>


@interface ParkViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, MBProgressHUDDelegate, CLLocationManagerDelegate>
{
    //IBOutlet UIScrollView *photoScrollView;
    //NSMutableArray *allImages;
    
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) CLLocationManager *locationManager;


- (IBAction)takePhoto:(id)sender;

- (IBAction)addNote:(id)sender;

- (IBAction)addLocation:(id)sender;

//- (IBAction)addAlarm:(id)sender;

- (IBAction)mark:(id)sender;


@end
