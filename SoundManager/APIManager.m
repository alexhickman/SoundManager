//
//  APIManager.m
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "APIManager.h"
#import <Parse/Parse.h>
#import "Sounds.h"

@implementation APIManager

static APIManager *sMyApi;

+ (APIManager *)sharedManager
{
    static dispatch_once_t tokenToRunOnlyOnce;
    
    dispatch_once(&tokenToRunOnlyOnce, ^{
        sMyApi = [[APIManager alloc]init];
    });
    return sMyApi;
}

- (NSMutableArray *)populateSoundsArray
{
    NSMutableArray *arrayOfSounds = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Sounds"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            NSLog(@"Successfully retrieved %lu sounds", (unsigned long)objects.count);
            for (PFObject *sound in objects)
            {
                NSString *fileName = sound[@"fileName"];
                PFFile *soundFile = sound[@"audioFile"];
                [soundFile getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
                    if (error)
                    {
                        NSLog(@"Error: %@ %@", error, [error userInfo]);
                    }
                    else
                    {
                        NSData *soundData = data;
                        Sounds *newSound = [Sounds makeSoundWith:fileName andSound:soundData];
                        [arrayOfSounds addObject:newSound];
                    }
                }];
            }
        }
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    return arrayOfSounds;
}

@end
