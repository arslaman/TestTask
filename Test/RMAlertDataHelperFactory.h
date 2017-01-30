//
//  RMAlertDataHelperFactory.h
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMAlertDataHelper.h"
#import "RMAlertData.h"

@protocol RMAlertDataHelperFactory <NSObject>

- (id<RMAlertDataHelper>)helperWithData:(RMAlertData *)data;

@end

@interface RMAlertDataHelperFactory : NSObject <RMAlertDataHelperFactory>

@end
