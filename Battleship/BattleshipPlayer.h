//
//  BattleshipPlayer.h
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BattleshipsGame.h"
#import "SeaGridViewController.h"
#import <UIKit/UIKit.h>

@interface BattleshipPlayer : NSObject
@property NSArray *shipsGrids;
@property NSMutableArray *hits;

- (NSMutableArray *)randomGrid;
- (void)setHit;
- (void)setUpGrid;
- (BOOL)checkTop;
- (BOOL)checkBottom;
- (BOOL)checkLeft;
- (BOOL)checkRight;
- (NSMutableArray *)directions;


@end
