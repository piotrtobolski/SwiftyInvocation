#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif


FOUNDATION_EXPORT double SwiftyInvocationVersionNumber;
FOUNDATION_EXPORT const unsigned char SwiftyInvocationVersionString[];

#import <SwiftyInvocation/SIInvocation.h>
#import <SwiftyInvocation/SIMethodSignature.h>
#import <SwiftyInvocation/NSObject+SwiftyInvocation.h>
