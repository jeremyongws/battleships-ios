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
@property NSMutableArray *playerOneMap; // refer to my map indicator
@property NSMutableArray *playerTwoMap; // refer to my map indicator
@property NSMutableArray *playerOneActions; // [miss, hit, untouched]
@property NSMutableArray *playerTwoActions; // [miss, hit, untouched]
@property NSString *currentPlayer; //@"Player 1" @"Player 2"

@end

@implementation SeaGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
		[self initializeGame];
}

- (IBAction)seaGridViewButtons:(UIButton *)sender {
    NSString *buttonPressed = sender.titleLabel.text;
}

- (void)populateBoard:(NSArray *)map {

	int dice = arc4random_uniform(4)+1; // dice decides what ship (1 = gunboat, 2 = destroyer, 3 = cruiser)
	if (dice == 3){
		NSInteger mapLocation = arc4random_uniform([map count])-1;
		[[map objectAtIndex:arc4random_uniform(mapLocation)] setString:@"G"];
		if (mapLocation < 5){
			[[map objectAtIndex:arc4random_uniform(mapLocation)+5] setString:@"G"];
			[[map objectAtIndex:arc4random_uniform(mapLocation)+10] setString:@"G"];
		} else if (mapLocation > 20){
			[[map objectAtIndex:arc4random_uniform(mapLocation)-5] setString:@"G"];
			[[map objectAtIndex:arc4random_uniform(mapLocation)-10] setString:@"G"];
		}
	} else if (dice == 2){
		NSInteger mapLocation = arc4random_uniform([map count])-1;
		[[map objectAtIndex:arc4random_uniform(mapLocation)] setString:@"D"];
		if (mapLocation < 5){
			[[map objectAtIndex:arc4random_uniform(mapLocation)+5] setString:@"D"];
		} else if (mapLocation > 20){
			[[map objectAtIndex:arc4random_uniform(mapLocation)-5] setString:@"D"];
		}
	} else if (dice == 1){
		NSInteger mapLocation = arc4random_uniform([map count])-1;
		[[map objectAtIndex:arc4random_uniform(mapLocation)] setString:@"D"];
	}

}

- (void)checkWinner {
	NSInteger count = 0;
	if ([self.currentPlayer isEqualToString:@"Player 1"]){
		
		for (NSInteger i = 0; i < 25; i++) {
			if ([[self.playerOneActions objectAtIndex:i] isEqual: @"hit"] && [self.playerTwoMap objectAtIndex:i]) {
				count++;
			}
			if (count == 25){
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"We have a winner!" message:@"Player 1 is the winner" preferredStyle:UIAlertViewStyleDefault];
				UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Try again." style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
					// go back to last view
				}];;
				[alert addAction:ok];
			} else {
				self.currentPlayer = @"Player 2";
			}
		}
	} else {
		for (NSInteger i = 0; i < 25; i++) {
			if ([[self.playerTwoActions objectAtIndex:i] isEqual: @"hit"] && [self.playerOneMap objectAtIndex:i]) {
				count++;
			}
			if (count == 25){
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"We have a winner!" message:@"Player 1 is the winner" preferredStyle:UIAlertViewStyleDefault];
				UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Try again." style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
					// go back to last view
				}];;
				[alert addAction:ok];
			} else {
				self.currentPlayer = @"Player 2";
			}
		}
	}
}

- (void)initializeGame{
	for (UIButton *button in self.seaGridViewButtons) {
		button.restorationIdentifier = button.titleLabel.text;
	}
	for (UIButton *button in self.seaGridViewButtons){
		[button setBackgroundColor:[UIColor greenColor]];
//		[button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
		button.titleLabel.text = @"";
	}
	self.currentPlayer = @"Player 1";
	self.playerOneMap = [self.playerOneMap initWithCapacity:25];
	self.playerTwoMap = [self.playerTwoMap initWithCapacity:25];
	self.playerTwoActions = [self.playerTwoActions initWithCapacity:25];
	self.playerTwoActions = [self.playerOneActions initWithCapacity:25];
	[self populateBoard:self.playerOneMap];
	[self populateBoard:self.playerTwoMap];
}


@end
