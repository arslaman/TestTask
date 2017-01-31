//
//  RMRootWireframe.h
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMServicesFactory.h"

@protocol RMRootWireframe <NSObject>

- (void)presentHomeModule;
- (void)presentAlertModuleWithData:(RMAlertData *)data;

- (void)presentContactUsAlertController;
- (void)presentRemindLaterAlertController;
- (void)presentMarkAsResolvedAlertController;

@end

@interface RMRootWireframe : NSObject <RMRootWireframe>

- (instancetype)initWithServicesFactory:(id<RMServicesFactory>)servicesFactory;

/**
 * Configures UI to present app.
 *
 * Takes control over window and presents default view controller
 *
 * @param window application's window
 */
- (void)installToWindow:(UIWindow *)window;

@end
