//
//  RMAlertEventData.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMAlertEventData : NSObject

@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithDate:(NSDate *)date;

@end
