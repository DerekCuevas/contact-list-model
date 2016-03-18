//
//  Name.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import "Name.h"

@implementation Name

- (NSString *)first {
    if (!_first) {
        _first = [[NSString alloc] init];
    }
    return _first;
}

- (NSString *)last {
    if (!_last) {
        _last = [[NSString alloc] init];
    }
    return _last;
}

+ (id)firstName:(NSString *)first lastName:(NSString *)last {
    Name *name = [[Name alloc] init];
    name.first = first;
    name.last = last;
    
    return name;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"(%@ %@)", self.first, self.last];
}

- (NSComparisonResult)compare:(Name *)name {
    if ([self.last isEqualToString:name.last]) {
        return [self.first compare:name.first];
    }
    return [self.last compare:name.last];
}

@end
