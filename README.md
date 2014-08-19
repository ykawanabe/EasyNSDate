Library to easily use NSDate, since I hate dealing with it.

# Install
```
Pod EasyNSDate
```

# How to use

## String to date
Give NSDate using US time formatter. Gregorian Calendar for calendar, en_US_POSIX for locale, second parameter for format are set for NSDateformat. Even if calendar setting of iPhone is changed, it doesn't affect NSDate handling because of those settings.  
`+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;`
  
## Date manipulation
`- (NSDate *)firstDateOfMonth;`
`- (NSDate *)lastDateOfMonth;`

## Log
`- (void)dateLog;`
