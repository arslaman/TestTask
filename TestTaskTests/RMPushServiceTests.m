//
//  RMPushServiceTests.m
//  TestTask
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "RMPushService.h"
#import "RMRootWireframe.h"

@interface RMPushServiceTests : XCTestCase

@property (nonatomic, strong) id<RMRootWireframe> rootWireframe;
@property (nonatomic, strong) id<RMParserService> parserService;
@property (nonatomic, strong) RMPushService *pushService;

@end

@implementation RMPushServiceTests

- (void)setUp {
    [super setUp];
    
    self.rootWireframe = OCMProtocolMock(@protocol(RMRootWireframe));
    self.parserService = OCMProtocolMock(@protocol(RMParserService));
    self.pushService = [[RMPushService alloc] initWithRootWireframe:self.rootWireframe
                                                      parserService:self.parserService];
}

- (void)testPushReceivingWithCorrectData {
    NSDictionary *userInfo = @{};
    RMAlertData *alertData = [RMAlertData new];
    
    OCMStub([self.parserService alertDataWithData:userInfo]).andReturn(alertData);
    [self.pushService receivedNotification:userInfo];
    OCMVerify([self.rootWireframe presentAlertModuleWithData:alertData]);
}

- (void)testPushReceivingWithIncorrectData {
    NSDictionary *userInfo = @{};
    RMAlertData *alertData = nil;
    
    OCMStub([self.parserService alertDataWithData:userInfo]).andReturn(alertData);
    
    // this method mustn't be called
    OCMReject([self.rootWireframe presentAlertModuleWithData:OCMOCK_ANY]);
    
    [self.pushService receivedNotification:userInfo];
}


@end
