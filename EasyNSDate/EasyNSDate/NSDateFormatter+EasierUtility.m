//
//  NSDateFormatter+EasierUtility.m
//  EasyNSDate
//
//  Created by Kawanabe Yusuke on 8/19/14.
//  Copyright (c) 2014 Jeffsuke. All rights reserved.
//

#import "NSDateFormatter+EasierUtility.h"

@implementation NSDateFormatter (EasierUtility)

+ (NSDateFormatter *)USDateFormatterWithDateFormat:(NSString *)dateFormat
{
    static NSLocale* en_US_POSIX = nil;
    if (!en_US_POSIX) {
        en_US_POSIX = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    formatter.locale = en_US_POSIX;
    formatter.timeZone = [NSTimeZone systemTimeZone];
    
    if (dateFormat.length > 0) {
        formatter.dateFormat = dateFormat;
    }
    
    return formatter;
}

+ (NSDateFormatter *)DateFormatterWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    formatter.locale = [NSLocale currentLocale];
    formatter.timeZone = [NSTimeZone systemTimeZone];
    
    if (dateFormat.length > 0) {
        formatter.dateFormat = dateFormat;
    }
    
    return formatter;
}


@end
