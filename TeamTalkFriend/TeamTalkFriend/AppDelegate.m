//
//  AppDelegate.m
//  TeamTalkFriend
//
//  Created by xifeng on 2/4/16.
//  Copyright © 2016 Dianyong Zheng. All rights reserved.
//

#import "AppDelegate.h"
#import "TeamTalkLauncher.h"
#import "RemoteCommander.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    [TeamTalkLauncher launch];
//    [TeamTalkLauncher active];
    [[RemoteCommander sharedInstance] enableAutoReply];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
