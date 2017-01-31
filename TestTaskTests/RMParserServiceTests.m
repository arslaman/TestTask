//
//  RMParserServiceTests.m
//  TestTask
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "RMParserService.h"

@interface RMParserServiceTests : XCTestCase

@property (nonatomic, strong) RMParserService *parserService;
@property (nonatomic, strong) id<RMAlertParserWorker> alertParserWorker;

@end

@implementation RMParserServiceTests

- (void)setUp {
    [super setUp];
    
    self.alertParserWorker = OCMProtocolMock(@protocol(RMAlertParserWorker));
    self.parserService = [[RMParserService alloc] initWithAlertParserWorker:self.alertParserWorker];
}

- (void)testAlertDataParsing {
    NSDictionary *data = @{};
    
    [self.parserService alertDataWithData:data];
    OCMVerify([self.alertParserWorker alertDataWithData:data]);
}

@end
