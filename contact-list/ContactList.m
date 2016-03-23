//
//  ContactList.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import "ContactList.h"

@interface ContactList ()

@property (strong, nonatomic) NSMutableArray *contacts;

@end

@implementation ContactList

#pragma mark - Lazily Instantiated Properties

- (NSMutableArray *)contacts {
    if (!_contacts) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return _contacts;
}

#pragma mark - Public Instance Methods

- (void)addPerson:(Person *)person {
    [self.contacts addObject:person];
}

- (NSArray *)orderedByName {
    return [self.contacts sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Person *person1 = (Person *)obj1;
        Person *person2 = (Person *)obj2;
        
        return [person1.name compare:person2.name];
    }];
}

- (NSArray *)phoneNumbersFor:(NSString *)lastName {
    for (Person *person in self.contacts) {
        if ([person.name.last isEqualToString:lastName]) {
            return [person phoneNumbersToNSArray];
        }
    }
    return nil;
}

- (NSString *)nameForNumber:(NSString *)number {
    for (Person *person in self.contacts) {
        if ([person hasNumber:number]) {
            return [person.name description];
        }
    }
    return nil;
}

- (void)enumerateContactsUsingBlock:(void (^)(Person *))block {
    [self.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block((Person *)obj);
    }];
}

#pragma mark - NSObject

- (NSString *)description {
    return [self.contacts description];
}

@end
