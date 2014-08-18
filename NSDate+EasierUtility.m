//
//  NSDate+EasierUtility.m
//  EasyNSDate
//
//  Created by Kawanabe Yusuke on 8/7/14.
//  Copyright (c) 2014 Jeffsuke. All rights reserved.
//

#import "NSDate+EasierUtility.h"

@implementation NSDate (EasierUtility)
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

- (NSDate *)firstDateOfMonth
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSDayCalendarUnit fromDate:self];
    dateComponents.day = 1;
    
    NSDate *date = [currentCalendar dateFromComponents:dateComponents];
    return date;
}

- (NSDate *)lastDateOfMonth
{
    NSDate *firstDate = [self lastDateOfMonth];
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = -1;
    
    NSCalendar *currentCalendar = [self gregorianCalendar];
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents
                                                    toDate:firstDate
                                                   options:0];
    return date;
}

- (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    dateFormatter.locale = [[NSLocale  alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    return dateFormatter;
}

- (NSCalendar *)gregorianCalendar
{
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

- (void)dateLog
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setLocale:[[NSLocale  alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"Date is %@", dateString);
}

@end
