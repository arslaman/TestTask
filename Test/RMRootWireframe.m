//
//  RMRootWireframe.m
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMRootWireframe.h"
#import "RMAlertViewController.h"
#import "RMContactUsAlertController.h"
#import "RMRemindLaterAlertController.h"
#import "RMMarkAsResolvedAlertController.h"

static NSString * const StoryboardMain = @"Main";
static NSString * const StoryboardAlert = @"Alert";

@interface RMRootWireframe ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong, readonly) id<RMServicesFactory> services;
@property (nonatomic, strong) UIStoryboard *mainStoryboard;
@property (nonatomic, strong) UIStoryboard *alertStoryboard;

@property (nonatomic, strong) id<RMAlertController> contactUsAlertController;
@property (nonatomic, strong) id<RMAlertController> remindLaterAlertController;
@property (nonatomic, strong) id<RMAlertController> markAsResolvedAlertController;

@end

@implementation RMRootWireframe

- (instancetype)initWithServicesFactory:(id<RMServicesFactory>)servicesFactory {
    self = [super init];
    if (self) {
        _services = servicesFactory;
    }
    return self;
}

- (void)installToWindow:(UIWindow *)window {
    UINavigationController *nc = [UINavigationController new];
    
    self.window = window;
    self.window.rootViewController = nc;
    
    self.navigationController = nc;
    
    [self presentHomeModule];
}

#pragma mark RMRootWireframe

- (void)presentHomeModule {
    UIViewController *vc = [self.mainStoryboard instantiateInitialViewController];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)presentAlertModuleWithData:(RMAlertData *)data {
    
    RMAlertViewController *vc = [self.alertStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass([RMAlertViewController class])];
    
    RMAlertDataHelperFactory *helperFactory = [RMAlertDataHelperFactory new];
    [vc configureWithData:data
            helperFactory:helperFactory
            rootWireframe:self];
    
    UINavigationController *nc = [self.alertStoryboard instantiateInitialViewController];
    nc.viewControllers = @[vc];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController.visibleViewController presentViewController:nc
                                                                      animated:YES
                                                                    completion:nil];
    });
}

- (void)presentContactUsAlertController {
    [self.contactUsAlertController presentInController:self.navigationController.visibleViewController];
}

- (void)presentRemindLaterAlertController {
    [self.remindLaterAlertController presentInController:self.navigationController.visibleViewController];
}

- (void)presentMarkAsResolvedAlertController {
    [self.markAsResolvedAlertController presentInController:self.navigationController.visibleViewController];
}

#pragma mark Lazy Load

- (UIStoryboard *)mainStoryboard {
    if (!_mainStoryboard) {
        _mainStoryboard = [UIStoryboard storyboardWithName:StoryboardMain bundle:[NSBundle mainBundle]];
    }
    return _mainStoryboard;
}

- (UIStoryboard *)alertStoryboard {
    if (!_alertStoryboard) {
        _alertStoryboard = [UIStoryboard storyboardWithName:StoryboardAlert bundle:[NSBundle mainBundle]];
    }
    return _alertStoryboard;
}

- (id<RMAlertController>)contactUsAlertController {
    if (!_contactUsAlertController) {
        _contactUsAlertController = [RMContactUsAlertController new];
    }
    return _contactUsAlertController;
}

- (id<RMAlertController>)remindLaterAlertController {
    if (!_remindLaterAlertController) {
        _remindLaterAlertController = [RMRemindLaterAlertController new];
    }
    return _remindLaterAlertController;
}

- (id<RMAlertController>)markAsResolvedAlertController {
    if (!_markAsResolvedAlertController) {
        _markAsResolvedAlertController = [RMMarkAsResolvedAlertController new];
    }
    return _markAsResolvedAlertController;
}

@end
