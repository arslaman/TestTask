//
//  RMAlertCyberAgentEventData.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertCyberAgentEventData.h"

@implementation RMAlertCyberAgentEventData

- (instancetype)initWithDate:(NSDate *)date
                  sourceDate:(NSDate *)sourceDate
                creationDate:(NSDate *)creationDate
                        site:(NSString *)site
                      source:(NSString *)source
                       match:(RMAlertCyberAgentMatch)match
                       email:(NSString *)email {
    
    self = [super initWithDate:date];
    if (self) {
        _sourceDate = sourceDate;
        _creationDate = creationDate;
        _site = site;
        _source = source;
        _match = match;
        _email = email;
    }
    return self;
}

@end
