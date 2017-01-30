//
//  AppDelegate.m
//  Test
//
//  Created by Ruslan Mansurov on 1/26/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "AppDelegate.h"
#import "RMRootWireframe.h"

@interface AppDelegate ()

@property (nonatomic, strong) RMServicesFactory *servicesFactory;
@property (nonatomic, strong) RMRootWireframe *rootWireframe;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    self.servicesFactory = [RMServicesFactory new];
    self.rootWireframe = [[RMRootWireframe alloc] initWithServicesFactory:self.servicesFactory];
    
    self.servicesFactory.rootWireframe = self.rootWireframe;
    [self.rootWireframe installToWindow:self.window];
    
    launchOptions = [self fakeLaunchOptionsWithAlertData];
    
    if (launchOptions != nil) {
        NSDictionary *notificationData = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        [self.servicesFactory.pushService receivedNotification:notificationData];
    }
    
    return YES;
}

- (NSDictionary *)fakeLaunchOptionsWithAlertData {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"email-alert" ofType:@"json"];
    NSData *rawData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:rawData options:kNilOptions error:nil];
    
    NSDictionary *launchOptions = @{UIApplicationLaunchOptionsRemoteNotificationKey: jsonDictionary};
    return launchOptions;
}

@end
