//
//  NSDateFormatter+EasierUtility.h
//  EasyNSDate
//
//  Created by Kawanabe Yusuke on 8/19/14.
//  Copyright (c) 2014 Jeffsuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (EasierUtility)
+ (NSDateFormatter *)USDateFormatterWithDateFormat:(NSString *)dateFormat;
+ (NSDateFormatter *)DateFormatterWithDateFormat:(NSString *)dateFormat;

@end
