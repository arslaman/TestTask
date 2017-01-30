//
//  RMAlertDetailData.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertDetailData.h"

@implementation RMAlertDetailData

- (instancetype)initWithSubject:(NSString *)subject
                       iconName:(NSString *)iconName
                           from:(NSString *)from
                           date:(NSDate *)date {
    
    self = [super init];
    if (self) {
        _subject = subject;
        _iconName = iconName;
        _from = from;
        _date = date;
    }
    return self;
}

@end
