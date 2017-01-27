//
//  RMPushService.h
//  Test
//
//  Created by Ruslan Mansurov on 1/27/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMParserService.h"

@protocol RMRootWireframe;


@protocol RMPushService <NSObject>

- (void)receivedNotification:(NSDictionary *)userInfo;

@end

@interface RMPushService : NSObject <RMPushService>

- (instancetype)initWithRootWireframe:(id<RMRootWireframe>)rootWireframe
                        parserService:(id<RMParserService>)parserService;

@end
