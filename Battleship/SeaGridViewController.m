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
    // Do any additional setup after loading the view.
}


- (IBAction)seaGridViewButtons:(UIButton *)sender {
    NSString *buttonPressed = sender.titleLabel.text;

    
    
/* 
 Have each of of the UIButtons' identity being marked as its coordinate.
 Add all the UIButtons to have the necessary property outlet for modifications.
 
 */}


@end
