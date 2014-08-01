//
//  ParkViewController.h
//  ParkMark-iOS
//
//  Created by Leif on 7/31/14.
//  Copyright (c) 2014 Leif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParkViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)takePhoto:(id)sender;

- (IBAction)addNote:(id)sender;

//- (IBAction)addAlarm:(id)sender;



@end
