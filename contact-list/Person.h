//
//  Person.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Name.h"
#import "PhoneNumber.h"

@interface Person : NSObject

@property (strong, nonatomic) Name *name;

#pragma mark - Initializers

+ (id)firstName:(NSString *)first lastName:(NSString *)last;

#pragma mark - Public Instance Methods

- (void)setPhoneNumber:(PhoneNumber *)number;
- (NSString *)phoneNumber:(NSString *)type;
- (BOOL)hasNumber:(NSString *)number;
- (NSArray *)phoneNumbersToNSArray;

#pragma mark - NSObject

- (NSString *)description;

@end
