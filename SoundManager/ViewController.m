//
//  ViewController.m
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"
#import "SoundManager.h"
#import "Sounds.h"

@interface ViewController ()
{
    NSArray *arrayOfSounds;
    SoundManager *sSoundManagerInstance;
    NSData *selectedSoundData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APIManager *sApiInstance = [APIManager sharedManager];
    sSoundManagerInstance = [SoundManager sharedSoundManager];
    
    if ([arrayOfSounds count] != 0)
    {
        NSLog(@"Sounds already populated");
    }
    else
    {
        [sApiInstance retrieveSounds:^(NSArray<Sounds *> *sounds) {
            arrayOfSounds = [sounds sortedArrayUsingComparator:^(Sounds *sound1, Sounds *sound2) {
                return [sound1.fileName compare:sound2.fileName];
            }];
            [self.pickerViewSounds reloadAllComponents];
            [self.pickerViewSounds selectRow:3 * arrayOfSounds.count inComponent:0 animated:NO];
        }];
    }
    
    //setting defaults
    self.stepperLoopProperty.value = 0;
    self.stepperLoopProperty.minimumValue = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //creating a semi-infinite loop of sound files
    return 7*[arrayOfSounds count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return ((Sounds *)arrayOfSounds[row % [arrayOfSounds count]]).fileName;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //we want the selection to always be in the fourth set (so that it looks like it has stuff before and after)
    if (row < [arrayOfSounds count] || row >= (6 * [arrayOfSounds count]) )
    {
        row = row % [arrayOfSounds count];
        row += [arrayOfSounds count];
        [pickerView selectRow:row inComponent:component animated:NO];
    }
    selectedSoundData = ((Sounds *)arrayOfSounds[row % [arrayOfSounds count]]).audioFile;
}

- (IBAction)buttonPlay:(id)sender
{
    if (selectedSoundData == nil) {
        //default selected value
        selectedSoundData = ((Sounds *)arrayOfSounds[0]).audioFile;
    }

    [sSoundManagerInstance initWithData:selectedSoundData];
    [sSoundManagerInstance play];
}

- (IBAction)buttonPause:(id)sender
{
    [sSoundManagerInstance pause];
}

- (IBAction)buttonStop:(id)sender
{
    [sSoundManagerInstance stop];
}

- (IBAction)switchLoops:(id)sender
{
    //on state, if statements to prevent infinite playback when loop count negative.
    if ([self.switchLoopsProperty isOn]) {
        if (self.stepperLoopProperty.value == 0)
        {
            sSoundManagerInstance.numberOfLoops = 0;
        }
        else
        {
            sSoundManagerInstance.numberOfLoops = self.stepperLoopProperty.value - 1;
        }
    }
    //off state
    else
    {
        sSoundManagerInstance.numberOfLoops = 0;
    }
}
- (IBAction)stepperLoop:(id)sender
{
    self.labelLoop.text = [NSString stringWithFormat:@"%d", (int)self.stepperLoopProperty.value];
    if ([self.switchLoopsProperty isOn])
    {
        if (self.stepperLoopProperty.value == 0)
        {
            sSoundManagerInstance.numberOfLoops = 0;
        }
        else
        {
            sSoundManagerInstance.numberOfLoops = self.stepperLoopProperty.value - 1;
        }
    }
}

@end
