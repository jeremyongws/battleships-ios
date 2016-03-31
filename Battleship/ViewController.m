//
//  ViewController.m
//  Battleship
//
//  Created by Joanne Lim on 31/3/16.
//  Copyright © 2016 Daniel Chong. All rights reserved.
//

#import "ViewController.h"
#import "SeaGridViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SeaGridViewController *destination = segue.destinationViewController;
    
}

@end
