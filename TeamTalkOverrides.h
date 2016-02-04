#import <Foundation/Foundation.h>

@interface TeamTalkOverrides : NSObject

+ (void)load;
- (id)initWithMessageDataNew:(id)msgRsp;

@end
