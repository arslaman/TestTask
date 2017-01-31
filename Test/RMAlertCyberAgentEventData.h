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

/**
 * Data model for CyberAgent's event data.
 *
 * It contains email field, and I assume that any other data for
 * the rest match data will be here as properties.
 * So, i.e. in case of RMAlertCyberAgentMatchEmailAddress email property will be not empty,
 * and in case of RMAlertCyberAgentMatchCellPhone cellPhone will be not empty.
 */
@interface RMAlertCyberAgentEventData : RMAlertEventData

@property (nonatomic, strong, readonly) NSDate *sourceDate;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, copy, readonly) NSString *site;
@property (nonatomic, copy, readonly) NSString *source;
@property (nonatomic, assign, readonly) RMAlertCyberAgentMatch match;
@property (nonatomic, copy, readonly) NSString *email;


- (instancetype)initWithDate:(NSDate *)date
                  sourceDate:(NSDate *)sourceDate
                creationDate:(NSDate *)creationDate
                        site:(NSString *)site
                      source:(NSString *)source
                       match:(RMAlertCyberAgentMatch)match
                       email:(NSString *)email;

@end
