//
//  RMAlertDataHelperCyberAgent.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMAlertDataHelperCyberAgent.h"
#import "RMAlertCyberAgentEventData.h"

@interface RMAlertDataHelperCyberAgent ()

@property (nonatomic, strong) RMAlertData *data;

@end

@implementation RMAlertDataHelperCyberAgent

- (instancetype)initWithData:(RMAlertData *)data {
    
    if (data.type != RMAlertTypeCyberAgent) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _data = data;
    }
    return self;
}

- (NSString *)title {
    return NSLocalizedString(@"alert_detail_controller_title_email_leaked", @"Title of Alert controller in case of email leak");
}

- (NSString *)iconName {
    return @"ic-cyberagent-alert";
}

- (NSString *)description {
    return NSLocalizedString(@"alert_detail_controller_header_description_email_leaked", @"Description in header of Alert controller in case of email leak");
}

#pragma mark Details

- (NSArray<RMAlertDetailData *> *)details {
    
    NSMutableArray *array = [NSMutableArray new];
    for (RMAlertEventData *eventData in self.data.events) {
        if (![eventData isMemberOfClass:[RMAlertCyberAgentEventData class]]) {
            continue;
        }
        
        RMAlertDetailData *detailData = [self alertDetailWithEventData:(RMAlertCyberAgentEventData *)eventData];
        if (detailData != nil) {
            [array addObject:detailData];
        }
    }
    
    return array.count > 0 ? array.copy : nil;
}

- (RMAlertDetailData *)alertDetailWithEventData:(RMAlertCyberAgentEventData *)eventData {

    NSDate *date = eventData.sourceDate != nil ? eventData.sourceDate : eventData.creationDate;
    date = date != nil ? date : eventData.date;
    
    NSString *from = eventData.site.length > 0 ? eventData.site : eventData.source;
    NSString *subject = [self subjectWithEventData:eventData];
    NSString *iconName = [self iconNameWithEventData:eventData];
    
    RMAlertDetailData *detailData = [[RMAlertDetailData alloc] initWithSubject:subject
                                                                      iconName:iconName
                                                                          from:from
                                                                          date:date];
    return detailData;
}

- (NSString *)subjectWithEventData:(RMAlertCyberAgentEventData *)eventData {
    switch (eventData.match) {
        case RMAlertCyberAgentMatchEmailAddress:
            return eventData.email;
            break;
            
        default:
            break;
    }
    return nil;
}

- (NSString *)iconNameWithEventData:(RMAlertCyberAgentEventData *)eventData {
    switch (eventData.match) {
        case RMAlertCyberAgentMatchEmailAddress:
            return @"ic-email-alert";
            break;
            
        default:
            break;
    }
    return nil;
}

#pragma mark Risks

- (NSArray<NSString *> *)risks {
    NSMutableArray *array = [NSMutableArray new];
    for (RMAlertEventData *eventData in self.data.events) {
        if (![eventData isMemberOfClass:[RMAlertCyberAgentEventData class]]) {
            continue;
        }
        
        NSString *risk = [self alertRiskWithEventData:(RMAlertCyberAgentEventData *)eventData];
        if (risk != nil) {
            [array addObject:risk];
        }
    }
    
    return array.count > 0 ? array.copy : nil;
}

- (NSString *)alertRiskWithEventData:(RMAlertCyberAgentEventData *)eventData {
    
    switch (eventData.match) {
        case RMAlertCyberAgentMatchEmailAddress:
            return NSLocalizedString(@"alert_detail_controller_risk_email", @"Title of Risk in case of email leak");
            break;
            
        default:
            break;
    }
    
    return nil;
}

#pragma mark NextSteps

- (NSArray<RMAlertNextStepData *> *)nextSteps {
    NSMutableArray *array = [NSMutableArray new];
    for (RMAlertEventData *eventData in self.data.events) {
        if (![eventData isMemberOfClass:[RMAlertCyberAgentEventData class]]) {
            continue;
        }
        
        NSArray<RMAlertNextStepData *> *nextSteps = [self nextStepsWithEventData:(RMAlertCyberAgentEventData *)eventData];
        for (RMAlertNextStepData *nextStep in nextSteps) {
            // TODO: check if duplicate
            [array addObject:nextStep];
        }
    }
    
    return array.count > 0 ? array.copy : nil;
}

- (NSArray<RMAlertNextStepData *> *)nextStepsWithEventData:(RMAlertCyberAgentEventData *)eventData {
    NSMutableArray *nextSteps = [NSMutableArray new];
    switch (eventData.match) {
        case RMAlertCyberAgentMatchEmailAddress: {
            NSString *localizedTitle;
            
            localizedTitle = NSLocalizedString(@"alert_detail_controller_step_change_password_immediately", @"Step text of changing password immediately");
            [nextSteps addObject:[[RMAlertNextStepData alloc] initWithTitle:localizedTitle
                                                                   iconName:@"ic-ellipsis-step.png"]];
            
            localizedTitle = NSLocalizedString(@"alert_detail_controller_step_change_password_other_accounts", @"Step text of changing password accounts that is related to leaked");
            [nextSteps addObject:[[RMAlertNextStepData alloc] initWithTitle:localizedTitle
                                                                   iconName:@"ic-email-step.png"]];
            
            localizedTitle = NSLocalizedString(@"alert_detail_controller_step_keep_an_eye", @"Step text of keeping an eye");
            [nextSteps addObject:[[RMAlertNextStepData alloc] initWithTitle:localizedTitle
                                                                   iconName:@"ic-strangebehavior-step.png"]];
            break;
        }
            
        default:
            break;
    }
    
    return nextSteps.count > 0 ? nextSteps : nil;
}

@end
