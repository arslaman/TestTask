//
//  RMAlertDetailData.h
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMAlertDetailData : NSObject

@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, copy, readonly) NSString *subject;
@property (nonatomic, copy, readonly) NSString *from;
@property (nonatomic, strong, readonly) NSDate *date;

- (instancetype)initWithSubject:(NSString *)subject
                       iconName:(NSString *)iconName
                           from:(NSString *)from
                           date:(NSDate *)date;

@end
