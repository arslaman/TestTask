//
//  RMAlertParserWorker.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertParserWorker.h"
#import "NSDate+RMFormatter.h"

static NSString * const AlertDataIdKey = @"id";
static NSString * const AlertDataTypeKey = @"type";
static NSString * const AlertDataEventsKey = @"events";
static NSString * const AlertDataEventDataKey = @"data";
static NSString * const AlertDataEventDateKey = @"date";
static NSString * const AlertDataEventCreationDateKey = @"CreationDate";
static NSString * const AlertDataEventSourceDateKey = @"SourceDate";
static NSString * const AlertDataEventSiteKey = @"site";
static NSString * const AlertDataEventSourceKey = @"Source";
static NSString * const AlertDataEventMatchKey = @"match";
static NSString * const AlertDataEventEmailKey = @"email";

static NSString * const AlertDataEventMatchSSN = @"IDSSN";
static NSString * const AlertDataEventMatchDLNumber = @"IDDLNUMBER";
static NSString * const AlertDataEventMatchMedicalID = @"IDMEDICALID";
static NSString * const AlertDataEventMatchHomePhone = @"IDHOMEPHONE";
static NSString * const AlertDataEventMatchWorkPhone = @"IDWORKPHONE";
static NSString * const AlertDataEventMatchCellPhone = @"IDCELLPHONE";
static NSString * const AlertDataEventMatchEmailAddress = @"IDEMAILADDR";
static NSString * const AlertDataEventMatchCCN = @"IDCCN";
static NSString * const AlertDataEventMatchBank = @"IDBANK";
static NSString * const AlertDataEventMatchNational = @"IDNATIONAL";
static NSString * const AlertDataEventMatchIBAN = @"IDIBAN";
static NSString * const AlertDataEventMatchPassportNumber = @"IDPASSPORTNUM";
static NSString * const AlertDataEventMatchRetailCard = @"IDRETAILCARD";

@implementation RMAlertParserWorker

- (RMAlertData *)alertDataWithData:(NSDictionary *)data {
    
    NSString *identifier = data[AlertDataIdKey];
    RMAlertType type = [self alertTypeWithIntegerValue:[data[AlertDataTypeKey] integerValue]];
    NSArray *events = [self alertEventsWithData:data[AlertDataEventsKey] type:type];
    
    RMAlertData *alertData = [[RMAlertData alloc] initWithType:type
                                                    identifier:identifier
                                                        events:events];
    return alertData;
}

- (RMAlertType)alertTypeWithIntegerValue:(NSInteger)integerValue {
    switch (integerValue) {
        case 1: return RMAlertTypeCyberAgent;
        case 2: return RMAlertTypeSSNTrace;
        case 3: return RMAlertTypeSocialMedia;
    }
    return RMAlertTypeUnknown;
}

- (NSArray <RMAlertEventData *> *)alertEventsWithData:(NSArray *)data type:(RMAlertType)type {
    NSMutableArray *events = [NSMutableArray new];
    for (NSDictionary *eventRawData in data) {
        RMAlertEventData *eventData;
        
        switch (type) {
            case RMAlertTypeCyberAgent:
                eventData = [self alertCyberAgentEventDataWithData:eventRawData];
                break;
            case RMAlertTypeSocialMedia:
            case RMAlertTypeSSNTrace:
            default:
                break;
        }
        
        if (eventData != nil) {
            [events addObject:eventData];
        }
    }
    return events.copy;
}

- (RMAlertCyberAgentEventData *)alertCyberAgentEventDataWithData:(NSDictionary *)data {
    NSDate *date = [NSDate dateWithShortStyleString:data[AlertDataEventDateKey]];
    
    data = data[AlertDataEventDataKey];
    RMAlertCyberAgentMatch match = [self cyberAgentMatchWithStringValue:data[AlertDataEventMatchKey]];
    NSDate *sourceDate = [NSDate dateWithFullStyleString:data[AlertDataEventSourceDateKey]];
    NSDate *creationDate = [NSDate dateWithFullStyleString:data[AlertDataEventCreationDateKey]];
    
    return [[RMAlertCyberAgentEventData alloc] initWithDate:date
                                                 sourceDate:sourceDate
                                               creationDate:creationDate
                                                       site:data[AlertDataEventSiteKey]
                                                     source:data[AlertDataEventSourceKey]
                                                      match:match
                                                      email:data[AlertDataEventEmailKey]];
}

- (RMAlertCyberAgentMatch)cyberAgentMatchWithStringValue:(NSString *)stringValue {
    if ([stringValue isEqualToString:AlertDataEventMatchSSN]) {
        return RMAlertCyberAgentMatchSSN;
    } else if ([stringValue isEqualToString:AlertDataEventMatchDLNumber]) {
        return RMAlertCyberAgentMatchDLNumber;
    } else if ([stringValue isEqualToString:AlertDataEventMatchMedicalID]) {
        return RMAlertCyberAgentMatchMedicalID;
    } else if ([stringValue isEqualToString:AlertDataEventMatchHomePhone]) {
        return RMAlertCyberAgentMatchHomePhone;
    } else if ([stringValue isEqualToString:AlertDataEventMatchWorkPhone]) {
        return RMAlertCyberAgentMatchWorkPhone;
    } else if ([stringValue isEqualToString:AlertDataEventMatchCellPhone]) {
        return RMAlertCyberAgentMatchCellPhone;
    } else if ([stringValue isEqualToString:AlertDataEventMatchEmailAddress]) {
        return RMAlertCyberAgentMatchEmailAddress;
    } else if ([stringValue isEqualToString:AlertDataEventMatchCCN]) {
        return RMAlertCyberAgentMatchCCN;
    } else if ([stringValue isEqualToString:AlertDataEventMatchBank]) {
        return RMAlertCyberAgentMatchBank;
    } else if ([stringValue isEqualToString:AlertDataEventMatchNational]) {
        return RMAlertCyberAgentMatchNational;
    } else if ([stringValue isEqualToString:AlertDataEventMatchIBAN]) {
        return RMAlertCyberAgentMatchIBAN;
    } else if ([stringValue isEqualToString:AlertDataEventMatchPassportNumber]) {
        return RMAlertCyberAgentMatchPassportNumber;
    } else if ([stringValue isEqualToString:AlertDataEventMatchRetailCard]) {
        return RMAlertCyberAgentMatchRetailCard;
    }
    return RMAlertCyberAgentMatchUnknown;
}

@end
