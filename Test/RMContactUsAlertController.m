//
//  RMContactUsAlertController.m
//  Test
//
//  Created by Ruslan Mansurov on 31/01/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "RMContactUsAlertController.h"

@implementation RMContactUsAlertController

- (void)presentInController:(UIViewController *)controller {
    
    UIAlertController *alert = [self alert];
    [alert addAction:[self callAction]];
    [alert addAction:[self cancelAction]];
    
    [controller presentViewController:alert
                             animated:YES
                           completion:nil];
}

- (UIAlertController *)alert {
    NSString *title = NSLocalizedString(@"alert_dialog_contact_us_title", @"Title of Contact Us alert dialog");
    NSString *message = NSLocalizedString(@"alert_dialog_contact_us_message", @"Message of Contact Us alert dialog");
    
    return [UIAlertController alertControllerWithTitle:title
                                               message:message
                                        preferredStyle:UIAlertControllerStyleAlert];
}

- (UIAlertAction *)callAction {
    NSString *call = NSLocalizedString(@"alert_dialog_contact_us_button_call", @"Title of Call button in Contact Us alert dialog");
    return [UIAlertAction actionWithTitle:call
                                    style:UIAlertActionStyleDefault
                                  handler:nil];
}

- (UIAlertAction *)cancelAction {
    NSString *cancel = NSLocalizedString(@"alert_dialog_button_cancel", @"Title of Cancel button in Contact Us alert dialog");
    return [UIAlertAction actionWithTitle:cancel
                                    style:UIAlertActionStyleCancel
                                  handler:nil];
}

@end
