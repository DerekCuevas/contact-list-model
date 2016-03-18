//
//  main.m
//  contact-list
//
//  Created by Derek Cuevas on 3/18/16.
//  Copyright © 2016 Derek Cuevas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Name.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Name *me = [Name firstName:@"Derek" lastName:@"Cuevas"];
        
        NSLog(@"%@", me);
    }
    return 0;
}
