//
//  RMParserService.m
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMParserService.h"

@interface RMParserService ()

@property (nonatomic, strong, readonly) id<RMAlertParserWorker> alertParserWorker;

@end

@implementation RMParserService

- (instancetype)initWithAlertParserWorker:(id<RMAlertParserWorker>)alertParserWorker {
    self = [super init];
    if (self) {
        _alertParserWorker = alertParserWorker;
    }
    return self;
}

- (RMAlertData *)alertDataWithData:(NSDictionary *)data {
    return [self.alertParserWorker alertDataWithData:data];
}

@end
