//
//  Person.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import "Person.h"
#import "NSString+PhoneFormatting.h"

@interface Person ()

@property (strong, nonatomic) NSMutableDictionary *phoneNumbers;

@end

@implementation Person

#pragma mark - Lazily Instantiated Properties

- (NSMutableDictionary *)phoneNumbers {
    if (!_phoneNumbers) {
        _phoneNumbers = [[NSMutableDictionary alloc] init];
    }
    return _phoneNumbers;
}

- (Name *)name {
    if (!_name) {
        _name = [[Name alloc] init];
    }
    return _name;
}

#pragma mark - Initializers

+ (id)firstName:(NSString *)first lastName:(NSString *)last {
    Person *person = [[Person alloc] init];
    person.name = [Name firstName:first lastName:last];
    
    return person;
}

#pragma mark - Public Instance Methods

- (void)setPhoneNumber:(PhoneNumber *)number {
    [self.phoneNumbers setValue:number.number forKey:number.type];
}

- (NSString *)phoneNumber:(NSString *)type {
    return [self.phoneNumbers valueForKey:type];
}

- (BOOL)hasNumber:(NSString *)number {
    return [[self.phoneNumbers allValues] containsObject:[number phoneFormat]];
}

- (NSArray *)phoneNumbersToNSArray {
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    [self.phoneNumbers enumerateKeysAndObjectsUsingBlock:^(id type, id number, BOOL *stop) {
        [numbers addObject:[PhoneNumber type:type number:number]];
    }];
    
    return numbers;
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.name.description, [self phoneNumbersToNSArray]];
}

@end
