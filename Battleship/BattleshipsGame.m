//
//  BattleshipsGame.m
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import "BattleshipsGame.h"


@implementation BattleshipsGame



- (void)startGame:(BattleshipPlayer*)playerOne withPlayerTwo:(BattleshipPlayer*)playerTwo {
	[self setInProgress:YES];
	u_int32_t dice = arc4random_uniform(2) + 1;
	[self setPlayerOne:playerOne];
	[self setPlayerTwo:playerTwo];
	[[self playerOne] setUpGrid];
	[[self playerTwo] setUpGrid];
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
	int occurrencesOfShips = 0;
	for(NSString *string in [player hits]) {
				occurrencesOfShips += (![string isEqualToString:@"NO"]?1:0);
	}
	if ([player isEqual:[self playerOne]]) {
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

- (BattleshipPlayer*)notCurrentPlayer{
	if ([self.currentPlayer isEqual:[self playerOne]]){
			 return [self playerTwo];
	}else {
			return [self playerOne];
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
