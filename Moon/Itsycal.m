//
//  Itsycal.m
//  Itsycal2
//
//  Created by Sanjay Madan on 2/3/15.
//  Copyright (c) 2015 mowglii.com. All rights reserved.
//

#import "Itsycal.h"

MoDate Today(NSCalendar *cal)
{
    NSDateComponents *c = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate new]];
    return MakeDate((int)c.year, (int)c.month, (int)c.day);
}

NSImage *ItsycalDateIcon(int day, NSImage *datesImage)
{
    day = (day < 0 || day > 31) ? 0 : day;
    CGFloat width = 19, height = 14;
    NSImage *image = [NSImage imageWithSize:NSMakeSize(width, height) flipped:NO drawingHandler:^BOOL (NSRect dstRect) {
        [datesImage drawInRect:NSMakeRect(0, 0, width, height) fromRect:NSMakeRect(day * width, 0, width, height) operation:NSCompositeSourceOver fraction:1];
        return YES;
    }];
    [image setTemplate:YES];
    return image;
}