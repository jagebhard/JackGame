//
//  Turno.h
//  JackGame
//
//  Created by Sebastian Deira on 14/3/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Turno : NSObject
@property(nonatomic, assign) NSInteger label;
@property(nonatomic, assign) NSInteger taps;
+(instancetype) turnoWithLabel:(NSInteger)turnoLabel taps:(NSInteger)turnoTaps;

@end
