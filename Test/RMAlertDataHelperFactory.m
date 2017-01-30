//
//  RMAlertDataHelperFactory.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertDataHelperFactory.h"
#import "RMAlertDataHelperCyberAgent.h"

@implementation RMAlertDataHelperFactory

- (id<RMAlertDataHelper>)helperWithData:(RMAlertData *)data {
    id<RMAlertDataHelper> helper;
    
    switch (data.type) {
        case RMAlertTypeCyberAgent:
            helper = [[RMAlertDataHelperCyberAgent alloc] initWithData:data];
            break;
            
        default:
            break;
    }
    
    return helper;
}

@end
