//
//  PhoneNumber.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import "PhoneNumber.h"
#import "NSString+PhoneFormatting.h"

@implementation PhoneNumber

#pragma mark - Public Mutators

- (void)setType:(NSString *)type {
    _type = [type uppercaseString];
}

- (void)setNumber:(NSString *)number {
    _number = [number phoneFormat];
}

#pragma mark - Initializers

- (instancetype)initWithType:(NSString *)type number:(NSString *)number {
    self = [super init];
    if (self) {
        self.type = type;
        self.number = number;
    }
    return self;
}

+ (id)type:(NSString *)type number:(NSString *)number {
    PhoneNumber *phone = [[PhoneNumber alloc] init];
    phone.type = type;
    phone.number = number;
    
    return phone;
}

#pragma mark - Public Instance Methods

- (BOOL)isMobile {
    return [self.type isEqualToString:MOBILE];
}

- (BOOL)isLocal {
    NSString *area = [self area];
    return [area isEqualToString:@"619"] || [area isEqualToString:@"858"];
}

- (NSString *)area {
    NSRange range = self.number.length > 3 ? NSMakeRange(0, 3) : NSMakeRange(0, 0);
    return [self.number substringWithRange:range];
}

#pragma mark - Public Class Methods

+ (BOOL)isValidType:(NSString *)type {
    NSArray *types = @[MOBILE, HOME, WORK, MAIN, HOME_FAX, WORK_FAX, PAGER, OTHER];
    return [types containsObject:[type uppercaseString]];
}

+ (BOOL)isValidNumber:(NSString *)number {
    return [[PhoneNumber removeNonDigits:number] length] == 10;
}

+ (NSString *)removeNonDigits:(NSString *)number {
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"- "];
    return [[number componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: %@", self.type, self.number];
}

@end
