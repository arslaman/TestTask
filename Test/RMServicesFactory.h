//
//  RMServicesFactory.h
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMPushService.h"
#import "RMParserService.h"

@protocol RMRootWireframe;

@protocol RMServicesFactory <NSObject>

/**
 * Push notifications service
 */
@property (nonatomic, strong, readonly) id<RMPushService> pushService;

/**
 * Parser service
 *
 * Responsible to parse data into models
 */
@property (nonatomic, strong, readonly) id<RMParserService> parserService;

@end

@interface RMServicesFactory : NSObject <RMServicesFactory>

@property (nonatomic, weak) id<RMRootWireframe> rootWireframe;

@end
