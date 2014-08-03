//
//  DirecationViewController.h
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/2/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface DirecationViewController : UIViewController


@property (strong, nonatomic) PFObject *record;


@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *note;

- (IBAction)getDirection:(id)sender;

@end
