//
//  BattleshipsGame.h
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BattleshipPlayer.h"
#import <UIKit/UIKit.h>

@interface BattleshipsGame : NSObject

@property BattleshipPlayer *currentPlayer;
@property BattleshipPlayer *playerOne;
@property BattleshipPlayer *playerTwo;
@property BattleshipPlayer *winner;
@property BOOL inProgress;

- (void)startGame;
- (BOOL)checkWinner;
- (void)endTurn;

@end
