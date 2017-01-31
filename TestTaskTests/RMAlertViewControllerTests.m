//
//  RMAlertViewControllerTests.m
//  TestTask
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "RMAlertViewController.h"

@interface RMAlertViewControllerTests : XCTestCase

@property (nonatomic, strong) RMAlertViewController *controller;

@end

@interface RMAlertViewController (Actions)

- (void)contactUsAction:(id)sender;
- (void)remindMeLaterAction:(id)sender;
- (void)markAsResolvedAction:(id)sender;

@end

@implementation RMAlertViewControllerTests

- (void)setUp {
    [super setUp];
    
    self.controller = [RMAlertViewController new];
}

- (void)testConfigure {
    
    RMAlertData *alertData = OCMClassMock([RMAlertData class]);
    id<RMAlertDataHelperFactory> helperFactory = OCMProtocolMock(@protocol(RMAlertDataHelperFactory));
    id<RMRootWireframe> rootWireframe = OCMProtocolMock(@protocol(RMRootWireframe));
    
    [self.controller configureWithData:alertData
                         helperFactory:helperFactory
                         rootWireframe:rootWireframe];
    
    OCMVerify([helperFactory helperWithData:alertData]);
}

- (void)testContactUsAction {
    
    id<RMRootWireframe> rootWireframe = OCMProtocolMock(@protocol(RMRootWireframe));
    
    [self.controller configureWithData:nil
                         helperFactory:nil
                         rootWireframe:rootWireframe];
    
    [self.controller contactUsAction:nil];
    
    OCMVerify([rootWireframe presentContactUsAlertController]);
}

- (void)testRemindMeLaterAction {
    
    id<RMRootWireframe> rootWireframe = OCMProtocolMock(@protocol(RMRootWireframe));
    
    [self.controller configureWithData:nil
                         helperFactory:nil
                         rootWireframe:rootWireframe];
    
    [self.controller remindMeLaterAction:nil];
    
    OCMVerify([rootWireframe presentRemindLaterAlertController]);
}

- (void)testMarkAsResolvedAction {
    
    id<RMRootWireframe> rootWireframe = OCMProtocolMock(@protocol(RMRootWireframe));
    
    [self.controller configureWithData:nil
                         helperFactory:nil
                         rootWireframe:rootWireframe];
    
    [self.controller markAsResolvedAction:nil];
    
    OCMVerify([rootWireframe presentMarkAsResolvedAlertController]);
}

@end
