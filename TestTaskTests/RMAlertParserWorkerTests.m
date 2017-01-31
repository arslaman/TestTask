//
//  RMAlertParserWorkerTests.m
//  TestTask
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import "RMAlertParserWorker.h"
#import "RMAlertCyberAgentEventData.h"

@interface RMAlertParserWorkerTests : XCTestCase

@property (nonatomic, strong) RMAlertParserWorker *alertParserWorker;

@end

@implementation RMAlertParserWorkerTests

- (void)setUp {
    [super setUp];
    
    self.alertParserWorker = [RMAlertParserWorker new];
}

- (void)testCyberAgentAlertParsing {
    
    NSString *identifier = @"3130982:105";
    RMAlertType alertType = RMAlertTypeCyberAgent;
    NSDate *date = [self dateWithDay:19 month:9 year:2016];
    NSDate *creationDate = [self dateWithDay:30 month:1 year:2017];
    NSDate *sourceDate = [self dateWithDay:20 month:2 year:2016];
    NSString *email = @"testing@gmail.com";
    NSString *source = @"Test source";
    NSString *site = @"google.com";
    
    NSString *jsonString = [NSString stringWithFormat:@"{\"events\":[{\"data\":{\"SourceDate\":\"2016-02-20\",\"CreationDate\":\"2017-01-30 00:00:00\",\"Source\":\"%@\",\"site\":\"%@\",\"email\":\"%@\",\"match\":\"IDEMAILADDR\"},\"date\":\"2016-09-19\"}],\"id\":\"%@\",\"type\":1}",
                            source,
                            site,
                            email,
                            identifier];
    
    NSData *rawData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:rawData options:kNilOptions error:nil];
    
    RMAlertData *alertData = [self.alertParserWorker alertDataWithData:jsonDictionary];
    expect(alertData).notTo.beNil();
    expect(alertData.type).to.equal(alertType);
    expect(alertData.identifier).to.equal(identifier);
    
    expect(alertData.events.count).to.equal(1);
    RMAlertEventData *eventData = alertData.events.firstObject;
    expect([eventData class]).to.equal([RMAlertCyberAgentEventData class]);
    
    RMAlertCyberAgentEventData *cyberAgentEventData = (RMAlertCyberAgentEventData *)eventData;
    expect(cyberAgentEventData.match).to.equal(RMAlertCyberAgentMatchEmailAddress);
    expect(cyberAgentEventData.date).to.equal(date);
    expect(cyberAgentEventData.sourceDate).to.equal(sourceDate);
    expect(cyberAgentEventData.creationDate).to.equal(creationDate);
    expect(cyberAgentEventData.site).to.equal(site);
    expect(cyberAgentEventData.source).to.equal(source);
    expect(cyberAgentEventData.email).to.equal(email);
}

- (void)testSSNTraceAlertParsing {
    
    NSString *identifier = @"12345:67";
    RMAlertType alertType = RMAlertTypeSSNTrace;
    
    NSString *jsonString = [NSString stringWithFormat:@"{\"events\":[],\"id\":\"%@\",\"type\":2}", identifier];
    
    NSData *rawData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:rawData options:kNilOptions error:nil];
    
    RMAlertData *alertData = [self.alertParserWorker alertDataWithData:jsonDictionary];
    expect(alertData).notTo.beNil();
    expect(alertData.type).to.equal(alertType);
    expect(alertData.identifier).to.equal(identifier);
    
    expect(alertData.events.count).to.equal(0);
}

- (NSDate *)dateWithDay:(NSInteger)day
                  month:(NSInteger)month
                   year:(NSInteger)year {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = day;
    dateComponents.month = month;
    dateComponents.year = year;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    
    return [calendar dateFromComponents:dateComponents];
}

@end
