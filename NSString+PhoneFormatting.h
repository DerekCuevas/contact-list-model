//
//  NSString+PhoneFormatting.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"

@interface NSString (PhoneFormatting)

- (NSString *)phoneFormat;
- (PhoneNumber *)asPhoneNumber;

@end
