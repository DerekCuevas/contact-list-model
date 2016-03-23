//
//  main.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *me = [Person firstName:@"Derek" lastName:@"Cuevas"];
        PhoneNumber *mobile = [PhoneNumber type:MOBILE number:@"1234567890"];
        PhoneNumber *home = [PhoneNumber type:HOME number:@"0987654321"];
        
        [me setPhoneNumber:mobile];
        [me setPhoneNumber:home];
        
        Person *you = [Person firstName:@"Steve" lastName:@"Woz"];
        [you setPhoneNumber:[PhoneNumber type:MOBILE number:@"2345679345"]];
        
        ContactList *contacts = [[ContactList alloc] init];
        [contacts addPerson:me];
        [contacts addPerson:you];
        
        [contacts enumerateContactsUsingBlock:^(Person *person) {
            NSLog(@"%@", person);
        }];
        
        Person *steve = [[Person alloc] init];
        steve.name = [Name firstName:@"Steve" lastName:@"Jobs"];
        [steve setPhoneNumber:[PhoneNumber type:HOME number:@"1234567890"]];
        
        // blocks
        double (^square)(double x);
        
        square = ^double(double x) {
            return x * x;
        };
        
        NSLog(@"%f", square(5));
        
        __block int i = 0;
        int (^count)(void) = ^{
            i += 1;
            return i;
        };
        
        NSLog(@"%d", count());
        NSLog(@"%d", count());
        NSLog(@"%d", count());
        
        
        
        NSLog(@"%@", [contacts phoneNumbersFor:me.name.last]);
    }
    return 0;
}
