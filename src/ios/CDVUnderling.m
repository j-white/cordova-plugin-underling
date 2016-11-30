#import "CDVUnderling.h"
#import <Bindings/Bindings.h>

@interface CDVUnderling()
@end

@implementation CDVUnderling {
}

- (void)start:(CDVInvokedUrlCommand*)command {
  CDVUnderling* __weak weakSelf = self;
  NSDictionary *args = [command.arguments objectAtIndex:0];

  [self.commandDelegate runInBackground:^{
    NSLog(@"Starting Underling...");
    GoBindingsStartUnderling(args[@"mq"], args[@"instanceId"], args[@"location"], args[@"minionId"]);
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
