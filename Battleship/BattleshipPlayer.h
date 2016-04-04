//
//  BattleshipPlayer.h
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BattleshipPlayer : NSObject
@property NSArray *shipsGrids;
@property NSMutableArray *hits;
@property NSString *name;

- (BOOL)checkTop:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize;

- (BOOL)checkBottom:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize;
- (BOOL)checkLeft:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize;
- (BOOL)checkRight:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize;
- (NSMutableArray *)randomGrid;
- (BOOL)hasShipIn:(NSInteger)mapGrid;
- (void)setUpGrid;
- (NSMutableArray *)directions:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)size;

@end
