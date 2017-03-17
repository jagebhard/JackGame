//
//  GameController.m
//  JackGame
//
//  Created by Sebastian Deira on 7/3/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import "GameController.h"
#import "ViewController.h"
#import "NSNumber+RandomNumber.h"
#import "Turno.h"

@implementation GameController

-(void)startGame
{
    self.timeInterval = 3;
    self.points = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:(self.timeInterval) target:self selector:@selector(setLabel)userInfo:nil repeats:YES];
}

- (void)setLabel
{
    NSInteger label = [NSNumber randomBetween:0 and:8].integerValue;
    NSInteger tap = [NSNumber randomBetween:1 and:3].integerValue;
    self.turno = [Turno turnoWithLabel:label taps:tap];
}

-(void)winTurno
{
    self.points = self.points + 10;
}

@end
