//
//  BattleshipsGame.m
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import "BattleshipsGame.h"


@implementation BattleshipsGame



- (void)startGame{
	[self setInProgress:YES];
	u_int32_t dice = arc4random_uniform(2) + 1;
	[self setPlayerOne:[[BattleshipPlayer alloc] initWithName:@"Player 1"]];
	[self setPlayerTwo:[[BattleshipPlayer alloc] initWithName:@"Player 2"]];
	if (dice == 1) {
		[self setCurrentPlayer:[self playerOne]];
	} else {
		[self setCurrentPlayer:[self playerTwo]];
	}
}

- (BOOL)checkWinner{
	BattleshipPlayer *player = [self currentPlayer];
	NSInteger hitsCount = [[player hits] count];
	NSInteger shipCount;
	if ([player isEqual:[self playerOne]]){
		shipCount = [[[self playerTwo] shipsGrids] count];
	} else {
		shipCount = [[[self playerOne] shipsGrids] count];
	}
	
	if (shipCount == hitsCount){
		[self setInProgress:FALSE];
		return YES;
	} else {
		return NO;
	}
}

- (void)endTurn{
	if ([[self currentPlayer] isEqual:self.playerOne]){
		[self setCurrentPlayer:self.playerTwo];
	} else {
		[self setCurrentPlayer:self.playerOne];
	}
	
}

@end
