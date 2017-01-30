//
//  NSDate+RMFormatter.h
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RMFormatter)

+ (NSDate *)dateWithFullStyleString:(NSString *)string;
+ (NSDate *)dateWithShortStyleString:(NSString *)string;

- (NSString *)formatWithShortDateStyle;

@end
