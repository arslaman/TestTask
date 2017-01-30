//
//  NSDate+RMFormatter.m
//  Test
//
//  Created by Ruslan Mansurov on 1/30/17.
//  Copyright © 2017 Akvelon. All rights reserved.
//

#import "NSDate+RMFormatter.h"

@implementation NSDate (RMFormatter)

+ (NSDate *)dateWithFullStyleString:(NSString *)string {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    });
    
    return [dateFormatter dateFromString:string];
}

+ (NSDate *)dateWithShortStyleString:(NSString *)string {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd";
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    });
    
    return [dateFormatter dateFromString:string];
}

- (NSString *)formatWithShortDateStyle {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        // this enables us format date using current locale
        // benefits - user will see date in familiar way
        [dateFormatter setLocalizedDateFormatFromTemplate:@"ddMMyyyy"];
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
        dateFormatter.locale = NSLocale.currentLocale;
    });
    
    // but if we want to use "-" as separator we have to do these replacements
    // see http://stackoverflow.com/a/25215279/1820856
    NSString *dateString = [dateFormatter stringFromDate:self];
    dateString = [dateString stringByReplacingOccurrencesOfString:@"." withString:@"-"];
    dateString = [dateString stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    
    return dateString;
}


@end
