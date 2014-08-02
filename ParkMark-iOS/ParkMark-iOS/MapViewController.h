//
//  MapViewController.h
//  ParkMark-iOS
//
//  Created by Leif on 8/1/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)MarkLocation:(id)sender;

@end
