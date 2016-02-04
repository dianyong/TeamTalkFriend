//
//  RemoteCommander.m
//  TeamTalkFriend
//
//  Created by xifeng on 2/4/16.
//  Copyright © 2016 Dianyong Zheng. All rights reserved.
//

#import "RemoteCommander.h"

@implementation RemoteCommander

+ (instancetype)sharedInstance
{
    static id sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    if (self = [super init])
    {
        configuration = [NSMutableDictionary dictionary];
        [configuration setValue:@NO forKey:@"AutoReply"];
        [configuration setValue:[NSMutableArray array] forKey:@"AutoReplyRules"];
    }
    return self;
}

- (void)enableAutoReply
{
    [configuration setValue:@YES forKey:@"AutoReply"];
    [self saveConfiguration];
}

- (void)disableAutoReply
{
    [configuration setValue:@NO forKey:@"AutoReply"];
    [self saveConfiguration];
}

- (void)saveConfiguration
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:configuration options:NSJSONWritingPrettyPrinted error:&error];
    [jsonData writeToFile:@"/tmp/ttf.json" atomically:true];
}

@end
