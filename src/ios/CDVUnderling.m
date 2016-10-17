#import "CDVUnderling.h"
#import <Underling/Bindings.h>

@interface CDVUnderling()
@end

@implementation CDVUnderling {
}

- (void)start:(CDVInvokedUrlCommand*)command {
  CDVUnderling* __weak weakSelf = self;
  NSString *mq = [command.arguments objectAtIndex:0];
  NSString *opennmsId = [command.arguments objectAtIndex:1];
  NSString *location = [command.arguments objectAtIndex:2];
  NSString *minionId = [command.arguments objectAtIndex:3];
  
  [self.commandDelegate runInBackground:^{
    NSLog(@"Starting Underling...");
    GoBindingsStartUnderling(mq, opennmsId, location, minionId);
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [weakSelf.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  }];
}

- (void)stop:(CDVInvokedUrlCommand*)command {
  CDVUnderling* __weak weakSelf = self;
  
  [self.commandDelegate runInBackground:^{
    NSLog(@"Stopping Underling...");
    GoBindingsStopUnderling();
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [weakSelf.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
  }];
}


@end
