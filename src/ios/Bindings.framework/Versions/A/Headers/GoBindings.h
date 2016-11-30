// Objective-C API for talking to github.com/j-white/underling/bindings Go package.
//   gobind -lang=objc -prefix=Go github.com/j-white/underling/bindings
//
// File is generated by gobind. Do not edit.

#ifndef __GoBindings_H__
#define __GoBindings_H__

@import Foundation;
#include "GoUniverse.h"


FOUNDATION_EXPORT void GoBindingsStartUnderling(NSString* mq, NSString* opennmsId, NSString* location, NSString* minionId);

FOUNDATION_EXPORT void GoBindingsStopUnderling();

#endif
