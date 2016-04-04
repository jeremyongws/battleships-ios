//
//  SeaGridViewController.m
//  Battleship
//
//  Created by Joanne Lim on 31/3/16.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import "SeaGridViewController.h"
#import "ViewController.h"

@interface SeaGridViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *seaGridViewButtons;
@property (weak, nonatomic) IBOutlet UIButton *buttonAttack;
@property (weak, nonatomic) IBOutlet UIButton *buttonMyMap;
@property (weak, nonatomic) IBOutlet UILabel *seaGridLabel;
@property BattleshipsGame *currentGame;

@end

@implementation SeaGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	BattleshipPlayer *player1 = [[BattleshipPlayer alloc] init];
	BattleshipPlayer *player2 = [[BattleshipPlayer alloc] init];
	[self setCurrentGame:[[BattleshipsGame alloc] init]];
	[[self currentGame] startGame:player1 withPlayerTwo:player2];
	for (UIButton *button in [self seaGridViewButtons]){
		[button setBackgroundColor:[UIColor greenColor]];
		[button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
	}
}

- (IBAction)onGridPressed:(id)sender {
	[sender setEnabled:NO];
	BattleshipsGame *game = [self currentGame];
	int index = [[sender restorationIdentifier] intValue] - 1;
	if (![[game notCurrentPlayer] hasShipIn:index]){
		[sender setBackgroundColor:[UIColor yellowColor]];
		[sender setTitleColor:[UIColor yellowColor] forState:UIControlStateDisabled];
	} else if ([[game notCurrentPlayer] hasShipIn:index]){
		[sender setBackgroundColor:[UIColor redColor]];
		[sender setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
	}
	[[[game currentPlayer] hits] setObject:@"HIT" atIndexedSubscript:([[sender restorationIdentifier] integerValue] - 1)];
	
	[game checkWinner];
	
	if ([[game currentPlayer] isEqual:[game playerOne]]){
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Player Two's" message:@"turn" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *ok = [UIAlertAction
												 actionWithTitle:@"Ok"
												 style:UIAlertActionStyleDefault
												 handler:^(UIAlertAction * _Nonnull action) {
													 [[self currentGame] endTurn];
													 [self renderAttackPage];
												 }];;
		[alertController addAction:ok];
		[self presentViewController:alertController
											 animated:YES completion:nil];
	} else {
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Player One's" message:@"turn" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *ok = [UIAlertAction
												 actionWithTitle:@"Ok"
												 style:UIAlertActionStyleDefault
												 handler:^(UIAlertAction * _Nonnull action) {
													 [[self currentGame] endTurn];
													 [self renderAttackPage];
												 }];;
		[alertController addAction:ok];
		[self presentViewController:alertController
											 animated:YES completion:nil];
	}

}
- (IBAction)onMapButtonPressed:(id)sender {
	[self renderMapPage];
}

- (IBAction)onAttackButtonPressed:(id)sender {
	[self renderAttackPage];
}


- (void)renderAttackPage{
	NSMutableArray *currentPlayerHits = [[[self currentGame] currentPlayer] hits];
	NSArray *opponentShipGrid = [[[self currentGame] notCurrentPlayer] shipsGrids];
	for (UIButton *button in [self seaGridViewButtons]){
		NSInteger buttonID = [[button restorationIdentifier] integerValue];
		if ([[currentPlayerHits objectAtIndex:([[button restorationIdentifier] integerValue] - 1)] isEqualToString:@"NO"]){
			[button setEnabled:YES];
			[button setBackgroundColor:[UIColor greenColor]];
			[button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
		} else if ([[currentPlayerHits objectAtIndex:(buttonID - 1)] isEqualToString:@"HIT"] && ![[opponentShipGrid objectAtIndex:(buttonID - 1)] isEqualToString:@"NO"]){
			[button setEnabled:NO];
			[button setBackgroundColor:[UIColor redColor]];
			[button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
		} else {
			[button setEnabled:NO];
			[button setBackgroundColor:[UIColor yellowColor]];
			[button setTitleColor:[UIColor yellowColor] forState:UIControlStateDisabled];
		}
	}
}

- (void)renderMapPage{
	NSMutableArray *opponentHits = [[[self currentGame] notCurrentPlayer] hits];
	NSArray *ownShipGrid = [[[self currentGame] currentPlayer] shipsGrids];
	for (UIButton *button in [self seaGridViewButtons]){
		NSInteger buttonID = [[button restorationIdentifier] integerValue];
		if ([[ownShipGrid objectAtIndex:(buttonID -1)] isEqualToString:@"G"]){
			[button setTitle:@"G" forState:UIControlStateDisabled];
		} else if ([[ownShipGrid objectAtIndex:(buttonID -1)] isEqualToString:@"C"]){
			[button setTitle:@"C" forState:UIControlStateDisabled];
		} else if ([[ownShipGrid objectAtIndex:(buttonID -1)] isEqualToString:@"D"]){
			[button setTitle:@"D" forState:UIControlStateDisabled];
		} else {
			[button setTitle:@" " forState:UIControlStateDisabled];
		}
		if ([[opponentHits objectAtIndex:([[button restorationIdentifier] integerValue] - 1)] isEqualToString:@"NO"]){
			[button setEnabled:NO];
			[button setBackgroundColor:[UIColor whiteColor]];
			[button setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
		} else if ([[opponentHits objectAtIndex:(buttonID - 1)] isEqualToString:@"HIT"] && ![[ownShipGrid objectAtIndex:(buttonID - 1)] isEqualToString:@"NO"]){
			[button setEnabled:NO];
			[button setBackgroundColor:[UIColor redColor]];
			[button setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];

		} else {
			[button setEnabled:NO];
			[button setBackgroundColor:[UIColor yellowColor]];
			[button setTitleColor:[UIColor yellowColor] forState:UIControlStateDisabled];
		}
	}
}

@end
