//
//  ViewController.h
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewSounds;

@property (weak, nonatomic) IBOutlet UISwitch *switchLoopsProperty;
@property (weak, nonatomic) IBOutlet UIStepper *stepperLoopProperty;
@property (weak, nonatomic) IBOutlet UILabel *labelLoop;

@end

