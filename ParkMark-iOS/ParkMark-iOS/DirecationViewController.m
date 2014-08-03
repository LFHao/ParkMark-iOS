//
//  DirecationViewController.m
//  ParkMark-iOS
//
//  Created by Longfei Hao on 8/2/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import "DirecationViewController.h"

@interface DirecationViewController ()


@end

@implementation DirecationViewController


@synthesize record;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    
    //Get data
    
    PFFile *theImage = record[@"image"];
    NSData *imageData = [theImage getData];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    self.note.text = record[@"note"];
    NSLog(@"Data got");
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{

    PFGeoPoint *cur = record[@"geoLocation"];
    CLLocationCoordinate2D coord;
    coord.longitude = cur.longitude;
    coord.latitude = cur.latitude;
    
    //Drop pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    annotation.title = @"Pick me here!";
    [_mapView addAnnotation:annotation];
                                          
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 2000, 2000);
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    NSLog(@"Drop pin");
}


- (IBAction)getDirection:(id)sender
{
    PFGeoPoint * toLocation = record[@"geoLocation"];
    NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", toLocation.latitude, toLocation.longitude];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
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
