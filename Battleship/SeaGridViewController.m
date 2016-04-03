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

@end

@implementation SeaGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	BattleshipPlayer *player1 = [[BattleshipPlayer alloc] init];
	BattleshipPlayer *player2 = [[BattleshipPlayer alloc] init];
	BattleshipsGame *game = [[BattleshipsGame alloc] init];
	[game setPlayerOne:player1];
	[game setPlayerTwo:player2];
	[game setInProgress:YES];
	[game startGame];
	
}

@end
