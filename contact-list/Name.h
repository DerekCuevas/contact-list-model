//
//  Name.h
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Name : NSObject

@property (strong, nonatomic) NSString *first;
@property (strong, nonatomic) NSString *last;

#pragma mark - Initializers

+ (id)firstName:(NSString *)first lastName:(NSString *)last;

#pragma mark - NSObject

- (NSString *)description;
- (NSComparisonResult)compare:(Name *)name;

@end
