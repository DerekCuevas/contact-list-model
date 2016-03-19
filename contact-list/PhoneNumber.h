//
//  PhoneNumber.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const MOBILE = @"MOBILE";
static NSString* const HOME = @"HOME";
static NSString* const WORK = @"WORK";
static NSString* const MAIN = @"MAIN";
static NSString* const HOME_FAX = @"HOME_FAX";
static NSString* const WORK_FAX = @"WORK_FAX";
static NSString* const PAGER = @"PAGER";
static NSString* const OTHER = @"OTHER";

@interface PhoneNumber : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *type;

#pragma mark - Initializers

- (instancetype)initWithType:(NSString *)type number:(NSString *)number;
+ (id)type:(NSString *)type number:(NSString *)number;

#pragma mark - Public Instance Methods

- (BOOL)isMobile;
- (BOOL)isLocal;
- (NSString *)area;

#pragma mark - Public Class Methods

+ (BOOL)isValidType:(NSString *)type;
+ (BOOL)isValidNumber:(NSString *)number;
+ (NSString *)removeNonDigits:(NSString *)number;

#pragma mark - NSObject

- (NSString *)description;

@end
