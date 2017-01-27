//
//  RMAlertData.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMAlertCyberAgentEventData.h"

typedef NS_ENUM(NSUInteger, RMAlertType) {
    RMAlertTypeUnknown,
    RMAlertTypeCyberAgent,
    RMAlertTypeSocialMedia,
    RMAlertTypeSSNTrace,
};

@interface RMAlertData : NSObject

@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, assign, readonly) RMAlertType type;
@property (nonatomic, strong, readonly) NSArray <RMAlertEventData *> *events;

- (instancetype)initWithType:(RMAlertType)type
                  identifier:(NSString *)identifier
                      events:(NSArray <RMAlertEventData *> *)events;

@end
