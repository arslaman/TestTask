//
//  RMAlertEventData.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertEventData.h"

@implementation RMAlertEventData

- (instancetype)initWithDate:(NSDate *)date {
    self = [super init];
    if (self) {
        _date = date;
    }
    return self;
}

@end
