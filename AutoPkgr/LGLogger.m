//
//  LGLogger.c
//  AutoPkgr
//
//  Created by Eldon on 4/23/15.
//  Copyright (c) 2015 The Linde Group, Inc. All rights reserved.
//

#include "LGLogger.h"

NSString *quick_formatString(NSString *format, ...){
    NSString *string = nil;
    if (format) {
        va_list args;
        va_start(args, format);
        string = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    }
    return string ?: format;
}

// Debug Logging Method
void DLog(NSString *format, ...)
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"debug"]) {
        if (format) {
            va_list args;
            va_start(args, format);
            NSLogv([@"[DEBUG] " stringByAppendingString:format], args);
            va_end(args);
        }
    }
}

void DevLog(NSString *format, ...)
{
#if DEBUG
    if (format) {
        va_list args;
        va_start(args, format);
        NSLogv([@"[DEVEL] " stringByAppendingString:format], args);
        va_end(args);
    }
#endif
}