//
//  RMRootWireframe.m
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMRootWireframe.h"
#import "RMAlertViewController.h"

static NSString * const StoryboardMain = @"Main";
static NSString * const StoryboardAlert = @"Alert";

@interface RMRootWireframe ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong, readonly) id<RMServicesFactory> services;
@property (nonatomic, strong) UIStoryboard *mainStoryboard;
@property (nonatomic, strong) UIStoryboard *alertStoryboard;

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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentAlertModuleWithData:nil];
    });
}

#pragma mark RMRootWireframe

- (void)presentHomeModule {
    UIViewController *vc = [self.mainStoryboard instantiateInitialViewController];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)presentAlertModuleWithData:(RMAlertData *)data {
    RMAlertViewController *vc = [self.alertStoryboard instantiateInitialViewController];
//    vc.alertData = data;
    
    [self.navigationController.visibleViewController presentViewController:vc
                                                                  animated:YES
                                                                completion:nil];
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

@end
