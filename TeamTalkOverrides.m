#import "TeamTalkOverrides.h"

#include <objc/runtime.h>

static IMP originalImplementation = NULL;

@implementation TeamTalkOverrides

+ (void)load
{
    Method originalMethod = class_getInstanceMethod(NSClassFromString(@"MTMessageEntity"), @selector(initWithMessageData:));
    originalImplementation = method_getImplementation(originalMethod);
    Method replacedMethod = class_getInstanceMethod(NSClassFromString(@"TeamTalkOverrides"), @selector(initWithMessageDataNew:));
    method_exchangeImplementations(originalMethod, replacedMethod);
}

- (id)initWithMessageDataNew:(id)messageData {
    id messageEntity = originalImplementation(self, @selector(initWithMessageData:), messageData);
    printf("fromUserId:%d\n", [messageData fromUserId]);
    printf("toUserID:%d\n", [messageData toSessionId]);
    printf("encoded message:%s\n", [[messageData msgData] bytes]);
    printf("decoded message:%s\n", [[messageEntity getTextMessageContent] UTF8String]);
    //NSArray *object = @[@"265", @"266", @"{\"cmd_id\":1,\"content\":\"shakewindow\",\"service_id\":1}", @(1000)];
    //[[[NSClassFromString(@"DDSendP2PCmdAPI") alloc] init] requestWithObject:object Completion:nil];
    return messageEntity;
}

@end
