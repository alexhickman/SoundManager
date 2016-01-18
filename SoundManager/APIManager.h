//
//  APIManager.h
//  SoundManager
//
//  Created by Hickman on 1/14/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Sounds.h"

@interface APIManager : NSObject

+ (APIManager *)sharedManager;
//- (NSMutableArray *)populateSoundsArray;
- (void)retrieveSounds:(void (^)(NSArray<Sounds *> *sounds))completion;

@end
