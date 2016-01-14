//
//  ViewController.m
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"

@interface ViewController ()
{
    NSMutableArray *arrayOfSounds;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APIManager *sApiInstance = [APIManager sharedManager];
    
    if ([arrayOfSounds count] != 0)
    {
        NSLog(@"Sounds already populated");
    }
    else
    {
        arrayOfSounds = [sApiInstance populateSoundsArray];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
