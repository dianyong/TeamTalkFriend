//
//  RemoteCommander.h
//  TeamTalkFriend
//
//  Created by xifeng on 2/4/16.
//  Copyright © 2016 Dianyong Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteCommander : NSObject
{
    NSMutableDictionary *configuration;
}

+ (instancetype)sharedInstance;

- (void)enableAutoReply;
- (void)disableAutoReply;

@end
