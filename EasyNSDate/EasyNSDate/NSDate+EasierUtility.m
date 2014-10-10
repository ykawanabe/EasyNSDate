//
//  NSDate+EasierUtility.m
//  EasyNSDate
//
//  Created by Kawanabe Yusuke on 8/7/14.
//  Copyright (c) 2014 Jeffsuke. All rights reserved.
//

#import "NSDate+EasierUtility.h"
#import "NSDateFormatter+EasierUtility.h"

@implementation NSDate (EasierUtility)
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter USDateFormatterWithDateFormat:format];
    NSDate *date = [formatter dateFromString:dateString];
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

- (NSDate *)dateMonthsAfter:(NSInteger)months
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSDayCalendarUnit fromDate:self];
    dateComponents.month = months;
    
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSCalendar *)gregorianCalendar
{
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

- (void)dateLog
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [NSDateFormatter USDateFormatterWithDateFormat:nil];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString *dateString = [formatter stringFromDate:date];
    NSLog(@"Date is %@", dateString);
}

@end
