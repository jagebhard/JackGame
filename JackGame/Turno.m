//
//  Turno.m
//  JackGame
//
//  Created by Sebastian Deira on 14/3/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import "Turno.h"

@implementation Turno

+(instancetype)turnoWithLabel:(NSInteger)turnoLabel taps:(NSInteger)turnoTaps
{
    Turno *turno = [[Turno alloc] init];
    turno.label = turnoLabel;
    turno.taps = turnoTaps;
    return turno;
}
@end
