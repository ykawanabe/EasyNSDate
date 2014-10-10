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

- (NSDate *)firstDateOfMonth;
- (NSDate *)lastDateOfMonth;

- (NSDate *)dateMonthsAfter:(NSInteger)months;

- (void)dateLog;
@end
