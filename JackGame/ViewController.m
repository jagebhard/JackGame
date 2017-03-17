//
//  ViewController.m
//  JackGame
//
//  Created by Sebastian Deira on 9/2/17.
//  Copyright © 2017 Sebastian Deira. All rights reserved.
//

#import "ViewController.h"
#import "NSNumber+RandomNumber.h"
#import "GameController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Level;
@property (weak, nonatomic) IBOutlet UILabel *Points;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray * labelsCollection;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, assign) NSInteger label;
@property (nonatomic, assign) NSInteger taps;
@property (nonatomic, strong) GameController *gameController;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameController = [[GameController alloc] init];
    [self.gameController addObserver:self forKeyPath:@"turno" options:NSKeyValueObservingOptionNew |
NSKeyValueObservingOptionOld context:nil];
    [self.gameController addObserver:self forKeyPath:@"points" options:NSKeyValueObservingOptionNew |
     NSKeyValueObservingOptionOld context:nil];
    [self.gameController startGame];
    
}

- (void)setLabel
{

    NSString *tapLable = [NSString stringWithFormat:@"%ld",(long)self.taps];
     self.tapRecognizer.numberOfTapsRequired = self.taps;
    [self.tapRecognizer.view removeGestureRecognizer:self.tapRecognizer];
    if ([self.labelsCollection count] > self.label)
    {
        UILabel * uiLabel = [self.labelsCollection objectAtIndex:self.label];
        [uiLabel addGestureRecognizer:self.tapRecognizer];
        uiLabel.text = tapLable;
 
    }
    
}


-(void)clearLabelsAtPosition:(NSInteger)position
{
    if ([self.labelsCollection count] > position)
    {
        //subinde self.labeldsCollection[position]
        UILabel * uiLabel = [self.labelsCollection objectAtIndex:position];
        uiLabel.text = @"";
        
    }
    

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"turno"]) {
        //subindex change[NSKeyValueChange]
        [self clearLabelsAtPosition:self.label];
        Turno *turno = change[NSKeyValueChangeNewKey];
        self.label = turno.label;
        self.taps = turno.taps;
        [self setLabel];
    } else if ([keyPath isEqualToString:@"points"]) {
        long points = [[change objectForKey:NSKeyValueChangeNewKey] longValue];
        NSString *pointsLable = [NSString stringWithFormat:@"%ld", points];
        self.Points.text = pointsLable;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (IBAction)tapRecognizer:(id)sender {
    
    [self.gameController winTurno];
}


@end
