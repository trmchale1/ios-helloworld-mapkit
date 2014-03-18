//
//  HMViewController.h
//  iOS-HelloMe-MapKit
//
//  Created by Tim McHale on 3/18/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface HMViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;


@end
