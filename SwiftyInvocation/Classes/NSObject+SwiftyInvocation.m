//
//  NSObject+SwiftyInvocation.m
//  Pods
//
//  Created by Piotr Tobolski on 16.03.2017.
//
//

#import "NSObject+SwiftyInvocation.h"
#import "SIMethodSignature.h"
#import "SIMethodSignature_Private.h"

@implementation NSObject (SwiftyInvocation)

- (SIMethodSignature *)si_methodSignatureForSelector:(SEL)aSelector {
    return [[SIMethodSignature alloc] initWithMethodSignature:[self methodSignatureForSelector:aSelector]];
}

+ (SIMethodSignature *)si_instanceMethodSignatureForSelector:(SEL)aSelector {
    return [[SIMethodSignature alloc] initWithMethodSignature:[self instanceMethodSignatureForSelector:aSelector]];
}

@end
