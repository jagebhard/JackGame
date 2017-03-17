//
//  GameController.h
//  JackGame
//
//  Created by Sebastian Deira on 7/3/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Turno.h"

@interface GameController : NSObject
-(void)startGame;
-(void)winTurno;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, strong) Turno *turno;
@property (nonatomic, assign) long points;
@end
