//
//  BattleshipPlayer.m
//  Battleship
//
//  Created by Jeremy Ong on 01/04/2016.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import "BattleshipPlayer.h"

@implementation BattleshipPlayer

- (void)setUpGrid{
	[self setShipsGrids:[self randomGrid]];
}


- (void)setHit:(NSInteger)id{
	[[self hits] setObject:@TRUE atIndexedSubscript:id];
}

- (NSMutableArray *)randomGrid{
	NSMutableArray *mutableGrids = [[NSMutableArray alloc]
															initWithArray:@[@"NO",@"NO",@"NO",@"NO",@"NO",
																							@"NO",@"NO",@"NO",@"NO",@"NO",
																							@"NO",@"NO",@"NO",@"NO",@"NO",
																							@"NO",@"NO",@"NO",@"NO",@"NO",
																							@"NO",@"NO",@"NO",@"NO",@"NO"]];
	for (NSInteger i = 3; i < 0; i--) {
		int rand1 = arc4random_uniform(25);
		int rand2 = arc4random_uniform(25);
		int rand3 = arc4random_uniform(25);
		NSMutableArray *directions;
		if ([[mutableGrids objectAtIndex:rand1] isEqual:@"NO"]){
			directions = [self directions:mutableGrids index:rand1 shipSize:i];
			int rng = arc4random_uniform([directions count]);
			NSString *randomDir = [directions objectAtIndex:rng];
			if (i == 3){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 - 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 - 10)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 + 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 + 10)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 - 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 - 2)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 + 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand1 + 2)];
				}
			} else if (i == 2){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand1 - 5)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand1 + 5)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand1 - 1)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand1];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand1 + 1)];
				}
			} else if (i == 2){
				[mutableGrids setObject:@"G" atIndexedSubscript:rand1];
			}

		} else if ([[mutableGrids objectAtIndex:rand2] isEqual:@"NO"]) {
			directions = [self directions:mutableGrids index:rand2 shipSize:i];
			int rng = arc4random_uniform([directions count]);
			NSString *randomDir = [directions objectAtIndex:rng];
			if (i == 3){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 - 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 - 10)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 + 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 + 10)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 - 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 - 2)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 + 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand2 + 2)];
				}
			} else if (i == 2){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand2 - 5)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand2 + 5)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand2 - 1)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand2];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand2 + 1)];
				}
			} else if (i == 2){
				[mutableGrids setObject:@"G" atIndexedSubscript:rand2];
			}
				
			
		} else if ([[mutableGrids objectAtIndex:rand3] isEqual:@"NO"]) {
			directions = [self directions:mutableGrids index:rand3 shipSize:i];
			int rng = arc4random_uniform([directions count]);
			NSString *randomDir = [directions objectAtIndex:rng];
			if (i == 3){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 - 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 - 10)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 + 5)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 + 10)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 - 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 - 2)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"C" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 + 1)];
					[mutableGrids setObject:@"C" atIndexedSubscript:(rand3 + 2)];
				}
			} else if (i == 2){
				if ([randomDir isEqualToString:@"TOP"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand3 - 5)];
				} else if ([randomDir isEqualToString:@"BOT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand3 + 5)];
				} else if ([randomDir isEqualToString:@"LEFT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand3 - 1)];
				} else if ([randomDir isEqualToString:@"RIGHT"]){
					[mutableGrids setObject:@"D" atIndexedSubscript:rand3];
					[mutableGrids setObject:@"D" atIndexedSubscript:(rand3 + 1)];
				}
			} else if (i == 2){
				[mutableGrids setObject:@"G" atIndexedSubscript:rand3];
			}
				
		}
	}
	return [[NSMutableArray alloc] init];
}


// check possible ship directions
- (NSMutableArray *)directions:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)size {
	NSInteger shipSize = size;
	NSMutableArray *possibleDirections = [[NSMutableArray alloc] init];
	
	if([self checkTop:grids index:index shipSize:shipSize]){
		[possibleDirections addObject:@"TOP"];
	}
	if([self checkBottom:grids index:index shipSize:shipSize]){
		[possibleDirections addObject:@"BOT"];
	}
	if([self checkLeft:grids index:index shipSize:size]){
		[possibleDirections addObject:@"LEFT"];
	}
	if([self checkRight:grids index:index shipSize:size]){
		[possibleDirections addObject:@"RIGHT"];
	}
	return possibleDirections;
}

// check possible ship direction
- (BOOL)checkTop:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize{
	NSInteger maxTop = (shipSize - 1) * 5;
	if ((index - (maxTop)) < 0){
		return NO;
	} else {
		if ([[grids objectAtIndex:(index - 5)] isEqualToString:@"NO"] && [[grids objectAtIndex:(index - maxTop)] isEqualToString:@"NO"]){
				return YES;
		} else {
			return NO;
		}
	}
}

- (BOOL)checkBottom:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize{
	NSInteger maxBot = (shipSize - 1) * 5;
	if ((index + (maxBot)) > 25){
		return NO;
	} else {
		if ([[grids objectAtIndex:(index + 5)] isEqualToString:@"NO"] && [[grids objectAtIndex:(index + maxBot)] isEqualToString:@"NO"]){
				return YES;
		} else {
				return NO;
		}
	}
}

- (BOOL)checkLeft:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize{
	NSInteger maxLeft = (shipSize - 1);
	if (shipSize == 3) {
		if (index % 5 == 0 || index % 5 == 1){
			return NO;
		} else if ([[grids objectAtIndex:index] isEqualToString:@"NO"] && [[grids objectAtIndex:(index - 1)] isEqualToString:@"NO"] && [[grids objectAtIndex:(index - maxLeft)] isEqualToString:@"NO"]){
			return YES;
		}
	} else if (shipSize == 2){
		if (index % 5 == 0){
			return NO;
		} else if ([[grids objectAtIndex:index] isEqualToString:@"NO"] && [[grids objectAtIndex:(index-maxLeft)] isEqualToString: @"NO"]){
			return YES;
		}
	}
	return YES;
}

- (BOOL)checkRight:(NSMutableArray *)grids index:(NSInteger)index shipSize:(NSInteger)shipSize{
	NSInteger maxRight = (shipSize - 1);
	if (shipSize == 3) {
		if (index % 5 == 4 || index % 5 == 3){
			return NO;
		} else if ([[grids objectAtIndex:index] isEqualToString:@"NO"] && [[grids objectAtIndex:(index + 1)] isEqualToString:@"NO"] && [[grids objectAtIndex:(index + maxRight)] isEqualToString:@"NO"]){
			return YES;
		}
	} else if (shipSize == 2){
		if (index % 5 == 4){
			return NO;
		} else if ([[grids objectAtIndex:index] isEqualToString:@"NO"] && [[grids objectAtIndex:(index+maxRight)] isEqualToString: @"NO"]){
			return YES;
		}
	}
	return YES;
}

@end
