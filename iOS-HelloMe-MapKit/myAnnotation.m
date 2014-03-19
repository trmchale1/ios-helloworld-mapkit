//
//  myAnnotation.m
//  iOS-HelloMe-MapKit
//
//  Created by Tim McHale on 3/19/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}
@end
