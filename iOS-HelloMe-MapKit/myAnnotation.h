//
//  myAnnotation.h
//  iOS-HelloMe-MapKit
//
//  Created by Tim McHale on 3/19/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface myAnnotation : NSObject
@property (strong, nonatomic) NSString *title;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;

@end
