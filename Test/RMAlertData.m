//
//  RMAlertData.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertData.h"

@implementation RMAlertData

- (instancetype)initWithType:(RMAlertType)type
                  identifier:(NSString *)identifier
                      events:(NSArray <RMAlertEventData *> *)events {
    
    self = [super init];
    if (self) {
        _type = type;
        _identifier = identifier;
        _events = events;
    }
    return self;
}

@end
