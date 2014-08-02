//
//  ParkViewController.h
//  ParkMark-iOS
//
//  Created by Leif on 7/31/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <EventKit/EventKit.h>

@interface ParkViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;



- (IBAction)takePhoto:(id)sender;

- (IBAction)addNote:(id)sender;

- (IBAction)addLocation:(id)sender;

//- (IBAction)addAlarm:(id)sender;

- (IBAction)mark:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *location;
@property (strong, nonatomic) IBOutlet UIButton *photo;
@property (strong, nonatomic) IBOutlet UIButton *note;

@end
