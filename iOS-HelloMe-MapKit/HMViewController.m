//
//  HMViewController.m
//  iOS-HelloMe-MapKit
//
//  Created by Tim McHale on 3/18/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "HMViewController.h"
#import "myAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface HMViewController ()

@end

@implementation HMViewController
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //4
    self.mapView.delegate = self;
    //5
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 40.740384;
    coordinate1.longitude = -73.991146;
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY"];
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 40.741623;
    coordinate2.longitude = -73.992021;
    myAnnotation *annotation2 = [[myAnnotation alloc] initWithCoordinate:coordinate2 title:@"Pascal Boyer Gallery"];
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 40.739490;
    coordinate3.longitude = -73.991154;
    myAnnotation *annotation3 = [[myAnnotation alloc] initWithCoordinate:coordinate3 title:@"Virgin Records"];
    [self.mapView addAnnotation:annotation3];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.740848;
    zoomLocation.longitude= -73.991145;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //7
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //8
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        //9
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

@end
