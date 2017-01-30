//
//  RMServicesFactory.m
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMServicesFactory.h"

@interface RMServicesFactory ()

@property (nonatomic, strong, readwrite) id<RMPushService> pushService;
@property (nonatomic, strong, readwrite) id<RMParserService> parserService;

@end

@implementation RMServicesFactory

- (id<RMPushService>)pushService {
    if (!_pushService) {
        _pushService = [[RMPushService alloc] initWithRootWireframe:self.rootWireframe parserService:self.parserService];
    }
    return _pushService;
}

- (id<RMParserService>)parserService {
    if (!_parserService) {
        RMAlertParserWorker *worker = [RMAlertParserWorker new];
        _parserService = [[RMParserService alloc] initWithAlertParserWorker:worker];
    }
    return _parserService;
}

@end
