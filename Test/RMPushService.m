//
//  RMPushService.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMPushService.h"
#import "RMRootWireframe.h"

@interface RMPushService ()

@property (nonatomic, weak) id<RMRootWireframe> rootWireframe;
@property (nonatomic, weak) id<RMParserService> parserService;

@end

@implementation RMPushService

- (instancetype)initWithRootWireframe:(id<RMRootWireframe>)rootWireframe
                        parserService:(id<RMParserService>)parserService {
    
    self = [super init];
    if (self) {
        _rootWireframe = rootWireframe;
        _parserService = parserService;
    }
    return self;
}

- (void)receivedNotification:(NSDictionary *)userInfo {
    RMAlertData *alertData = [self.parserService alertDataWithData:userInfo];
    if (alertData != nil) {
        [self.rootWireframe presentAlertModuleWithData:alertData];
    }
}

@end
