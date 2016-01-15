//
//  SoundManager.m
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

static SoundManager *sMySoundManager;

+ (SoundManager *)sharedSoundManager
{
    static dispatch_once_t tokenToRunOnlyOnce;
    
    dispatch_once(&tokenToRunOnlyOnce, ^{
        sMySoundManager = [[SoundManager alloc]init];
    });
    return sMySoundManager;
}

- (void)initWithData:(NSData *)soundData
{
    self.player = [[AVAudioPlayer alloc] initWithData:soundData error:nil];
    [self.player prepareToPlay];
}

- (void)play
{
    [self.player setNumberOfLoops:self.numberOfLoops];
    [self.player play];
}

- (void)stop
{
    [self.player stop];
}

- (void)pause
{
    if (self.player.playing)
    {
        [self.player pause];
    }
    else if (self.player.prepareToPlay)
    {
    [self.player play];
    }
}

@end
