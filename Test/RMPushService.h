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

/**
 * Handles received notification
 * 
 * Invoke it with appropriate data at AppDelegate's "application:didFinishLaunchingWithOptions:"
 * and "application:didReceiveRemoteNotification:".
 * It will parse notification data and present AlertViewController.
 *
 * @param userInfo dictionary data of received push notification
 */
- (void)receivedNotification:(NSDictionary *)userInfo;

@end

@interface RMPushService : NSObject <RMPushService>

- (instancetype)initWithRootWireframe:(id<RMRootWireframe>)rootWireframe
                        parserService:(id<RMParserService>)parserService;

@end
