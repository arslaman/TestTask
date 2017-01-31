//
//  RMAlertDataHelperFactoryTests.m
//  TestTask
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "RMAlertDataHelperFactory.h"
#import "RMAlertDataHelperCyberAgent.h"

@interface RMAlertDataHelperFactoryTests : XCTestCase

@property (nonatomic, strong) RMAlertDataHelperFactory *factory;

@end

@implementation RMAlertDataHelperFactoryTests

- (void)setUp {
    [super setUp];
    
    self.factory = [RMAlertDataHelperFactory new];
}

- (void)testFactoryWithCyberAgent {
    RMAlertData *data = OCMClassMock([RMAlertData class]);
    OCMStub([data type]).andReturn(RMAlertTypeCyberAgent);
    
    id<RMAlertDataHelper> dataHelper = [self.factory helperWithData:data];
    expect(dataHelper).notTo.beNil();
    expect([dataHelper class]).to.equal([RMAlertDataHelperCyberAgent class]);
}

- (void)testFactoryWithSocialMedia {
    RMAlertData *data = OCMClassMock([RMAlertData class]);
    OCMStub([data type]).andReturn(RMAlertTypeSocialMedia);
    
    id<RMAlertDataHelper> dataHelper = [self.factory helperWithData:data];
    expect(dataHelper).to.beNil();
}

@end
