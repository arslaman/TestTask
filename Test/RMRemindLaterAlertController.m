//
//  RMRemindLaterAlertController.m
//  Test
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMRemindLaterAlertController.h"

@implementation RMRemindLaterAlertController

- (void)presentInController:(UIViewController *)controller {
    
    UIAlertController *alert = [self alert];
    [alert addAction:[self okAction]];
    
    [controller presentViewController:alert
                             animated:YES
                           completion:nil];
}

- (UIAlertController *)alert {
    NSString *title = NSLocalizedString(@"alert_dialog_remind_later_title", @"Title of Remind Later alert dialog");
    NSString *message = NSLocalizedString(@"alert_dialog_remind_later_message", @"Message of Remind Later alert dialog");
    
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
}

- (UIAlertAction *)okAction {
    NSString *ok = NSLocalizedString(@"alert_dialog_button_ok", @"Title of OK button in Remind Later alert dialog");
    return [UIAlertAction actionWithTitle:ok
                                    style:UIAlertActionStyleDefault
                                  handler:nil];
}

@end
