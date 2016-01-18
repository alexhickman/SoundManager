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

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.numberOfLoops = 0;
        self.pan = 0.0;
        self.volume = 1.0;
        self.rate = 1.0;
        self.enableRate = NO;
    }
    return self;
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
    else
    {
    [self.player play];
    }
}

@end
