//
//  RMMarkAsResolvedAlertController.m
//  Test
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMMarkAsResolvedAlertController.h"

@implementation RMMarkAsResolvedAlertController

- (void)presentInController:(UIViewController *)controller {
    
    UIAlertController *alert = [self alert];
    [alert addAction:[self yesAction]];
    [alert addAction:[self cancelAction]];
    
    [controller presentViewController:alert
                             animated:YES
                           completion:nil];
}

- (UIAlertController *)alert {
    NSString *title = NSLocalizedString(@"alert_dialog_mark_as_resolved_title", @"Title of Mark As Resolved alert dialog");
    NSString *message = NSLocalizedString(@"alert_dialog_mark_as_resolved_message", @"Message of Mark As Resolved alert dialog");
    
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
}

- (UIAlertAction *)yesAction {
    NSString *yes = NSLocalizedString(@"alert_dialog_button_yes", @"Title of OK button in Mark As Resolved alert dialog");
    return [UIAlertAction actionWithTitle:yes
                                    style:UIAlertActionStyleDefault
                                  handler:nil];
}

- (UIAlertAction *)cancelAction {
    NSString *cancel = NSLocalizedString(@"alert_dialog_button_cancel", @"Title of Cancel button in Mark As Resolved alert dialog");
    return [UIAlertAction actionWithTitle:cancel
                                    style:UIAlertActionStyleCancel
                                  handler:nil];
}

@end
