//
//  NSNumber+RandomNumber.m
//  JackGame
//
//  Created by Sebastian Deira on 21/2/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import "NSNumber+RandomNumber.h"

@implementation NSNumber (RandomNumber)

+ (instancetype)randomBetween:(int)from and:(int)to
{
    int num =(int)from + arc4random() % (to-from+1);
    return @(num);
}

@end
