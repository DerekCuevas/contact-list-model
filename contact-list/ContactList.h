//
//  ContactList.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ContactList : NSObject

#pragma mark - Public Instance Methods

- (void)addPerson:(Person *)person;
- (NSArray *)orderedByName;
- (NSArray *)phoneNumbersFor:(NSString *)lastName;
- (NSString *)nameForNumber:(NSString *)number;

@end
