//
//  SoundManager.h
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundManager : NSObject

@property (strong, nonatomic) AVAudioPlayer *player;

//A value of 0.0 indicates silence; a value of 1.0 (the default) indicates full volume.
@property float volume;

//Position a sound in the stereo field. A value of –1.0 is full left, 0.0 is center, and 1.0 is full right.
@property float pan;

//Default value of 1.0 normal playback rate. Range is from 0.5 for 1/2 playback through 2.0 for double-speed.
@property float rate;

//To enable adjustable playback rate for an audio player, set this property to YES after you initialize the player and before you call the prepareToPlay instance method for the player.
@property BOOL enableRate;

//A value of 0, which is the default, means to play the sound once. Set a positive integer value to specify the number of times to return to the start and play again.
@property NSInteger numberOfLoops;

+ (SoundManager *)sharedSoundManager;
- (void)initWithData:(NSData *)soundData;
- (void)play;
- (void)stop;
- (void)pause;

@end
