//
//  TeamTalkLauncher.m
//  TeamTalkFriend
//
//  Created by xifeng on 2/4/16.
//  Copyright © 2016 Dianyong Zheng. All rights reserved.
//

#import "TeamTalkLauncher.h"

@import AppKit;

@implementation TeamTalkLauncher

+ (void)launch
{
    NSString *appPath = @"/Applications/TeamTalk.app/Contents/MacOS/TeamTalk";
    if ([[NSFileManager defaultManager] fileExistsAtPath:appPath]) {
        NSString *dylibPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TeamTalkOverrides" ofType:@"dylib"];
        NSString *command = [NSString stringWithFormat:@"DYLD_INSERT_LIBRARIES=\"%@\" \"%@\" &", dylibPath, appPath];
        system([command UTF8String]);
    }
}

+ (void)active
{
    NSArray *appArray = [NSRunningApplication runningApplicationsWithBundleIdentifier:@"com.mogujie.TeamTalk"];
    if ([appArray count] > 0)
    {
        [[appArray objectAtIndex:0] activateWithOptions:NSApplicationActivateIgnoringOtherApps];
    }
}

@end
