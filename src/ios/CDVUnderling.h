#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVUnderling : CDVPlugin

- (void)start:(CDVInvokedUrlCommand*)command;
- (void)stop:(CDVInvokedUrlCommand*)command;

@end
