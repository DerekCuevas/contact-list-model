//
//  Person.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Name.h"

@interface Person : NSObject

@property (strong, nonatomic) Name *name;

+ (id)firstName:(NSString *)first lastName:(NSString *)last;

- (void)setPhoneNumber:(PhoneNumber *)number;

@end
