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
    NSDateFormatter *formatter = [NSDateFormatter DateFormatterWithDateFormat:format];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

- (NSString *) stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter DateFormatterWithDateFormat:format];
    return [formatter stringFromDate:self];
}

// ================
// time adjustment
// ================
- (NSDate *)startOfTheDay
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)fromDate:self];
    
    NSDate *date = [currentCalendar dateFromComponents:dateComponents];
    return date;
}

- (NSDate *)endOfTheDay
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour|NSCalendarUnitMinute)fromDate:self];
    dateComponents.hour = 23;
    dateComponents.minute = 59;
    
    NSDate *date = [currentCalendar dateFromComponents:dateComponents];
    return date;
}

- (NSDate *)firstDateOfMonth
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour|NSCalendarUnitMinute) fromDate:self];
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


// ================
// Next and previouse time
// ================

- (NSDate *)tomorrow
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitDay fromDate:self];
    dateComponents.day = 1;
    
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSDate *)dateMonthsAfter:(NSInteger)months
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitMonth fromDate:self];
    dateComponents.month = months;
    
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSDate *)dateYearsAfter:(NSInteger)years;
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitYear fromDate:self];
    dateComponents.year = years;
    
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}


- (NSDate *)dateYearsBefore:(NSInteger)years
{
    NSCalendar *currentCalendar = [self gregorianCalendar];
    
    NSDateComponents *dateComponents = [currentCalendar components:NSCalendarUnitYear fromDate:self];
    dateComponents.year = - years;
    
    NSDate *date = [currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
    return date;
}

- (NSCalendar *)gregorianCalendar
{
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
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

+ (NSDate *)dateOfPostWithISO8601:(NSString *)dateString
{
    NSDateFormatter *inputFormat = [[NSDateFormatter alloc] init];
    [inputFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
    NSDate *date = [inputFormat dateFromString:dateString];
    
    return date;
}


- (BOOL)isSameDayWithDate:(NSDate*)date {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

- (NSString *)weekdayOfDate
{
    NSString *weekday = @"";
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale currentLocale];
    weekday = df.weekdaySymbols[components.weekday - 1];
    return weekday;
}
@end
