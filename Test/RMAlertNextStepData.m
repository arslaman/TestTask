//
//  RMAlertNextStepData.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertNextStepData.h"

@implementation RMAlertNextStepData

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName {
    
    self = [super init];
    if (self) {
        _title = title;
        _iconName = iconName;
    }
    return self;
}

@end
