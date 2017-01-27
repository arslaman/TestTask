//
//  RMAlertCyberAgentEventData.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertEventData.h"

typedef NS_ENUM(NSUInteger, RMAlertCyberAgentMatch) {
    RMAlertCyberAgentMatchUnknown,
    RMAlertCyberAgentMatchSSN,
    RMAlertCyberAgentMatchDLNumber,
    RMAlertCyberAgentMatchMedicalID,
    RMAlertCyberAgentMatchHomePhone,
    RMAlertCyberAgentMatchWorkPhone,
    RMAlertCyberAgentMatchCellPhone,
    RMAlertCyberAgentMatchEmailAddress,
    RMAlertCyberAgentMatchCCN,
    RMAlertCyberAgentMatchBank,
    RMAlertCyberAgentMatchNational,
    RMAlertCyberAgentMatchIBAN,
    RMAlertCyberAgentMatchPassportNumber,
    RMAlertCyberAgentMatchRetailCard,
};

@interface RMAlertCyberAgentEventData : RMAlertEventData

@property (nonatomic, strong, readonly) NSDate *sourceDate;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSString *site;
@property (nonatomic, strong, readonly) NSString *source;
@property (nonatomic, assign, readonly) RMAlertCyberAgentMatch match;
@property (nonatomic, strong, readonly) NSString *email;

- (instancetype)initWithDate:(NSDate *)date
                  sourceDate:(NSDate *)sourceDate
                creationDate:(NSDate *)creationDate
                        site:(NSString *)site
                      source:(NSString *)source
                       match:(RMAlertCyberAgentMatch)match
                       email:(NSString *)email;

@end
