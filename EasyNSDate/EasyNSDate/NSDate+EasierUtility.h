//
//  NSDate+EasierUtility.h
//  EasyNSDate
//
//  Created by Kawanabe Yusuke on 8/7/14.
//  Copyright (c) 2014 Jeffsuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EasierUtility)
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

- (NSString *) stringWithFormat:(NSString *)format;


// time
- (NSDate *)startOfTheDay;
- (NSDate *)endOfTheDay;

- (NSDate *)firstDateOfMonth;
- (NSDate *)lastDateOfMonth;

// Day
- (NSDate *)tomorrow;

// Month
- (NSDate *)dateMonthsAfter:(NSInteger)months;
- (NSDate *)dateYearsAfter:(NSInteger)years;

// Year
- (NSDate *)dateYearsBefore:(NSInteger)years;


- (void)dateLog;

+ (NSDate *)dateOfPostWithISO8601:(NSDictionary *)post;

- (BOOL)isSameDayWithDate:(NSDate*)date;

// weekday
- (NSString *)weekdayOfDate;
@end
