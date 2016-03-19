//
//  NSString+PhoneFormatting.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import "NSString+PhoneFormatting.h"

@implementation NSString (PhoneFormatting)

- (NSString *)phoneFormat {
    NSString *number = [PhoneNumber removeNonDigits:self];
    
    if (number.length != 10) {
        return nil;
    }
    
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    [parts addObject:[number substringWithRange:NSMakeRange(0, 3)]];
    [parts addObject:[number substringWithRange:NSMakeRange(3, 3)]];
    [parts addObject:[number substringFromIndex:6]];
    
    return [parts componentsJoinedByString:@"-"];
}

- (PhoneNumber *)asPhoneNumber {
    NSRange colon = [self rangeOfString:@":"];
    
    if (colon.location != NSNotFound) {
        NSString *type = [self substringToIndex:colon.location];
        NSString *number = [self substringFromIndex:colon.location + 1];
        
        if ([PhoneNumber isValidType:type] && [PhoneNumber isValidNumber:number]) {
            return [PhoneNumber type:type number:number];
        }
    }
    @throw([NSException exceptionWithName:@"Incorrect Phone Number Format."
                                   reason:@"Must be of form \"type: number\""
                                 userInfo:nil]);
}

@end
