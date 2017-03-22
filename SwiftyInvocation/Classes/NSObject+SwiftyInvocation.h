//
//  NSObject+SwiftyInvocation.h
//  Pods
//
//  Created by Piotr Tobolski on 16.03.2017.
//
//

#import <Foundation/Foundation.h>

@class SIMethodSignature;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SwiftyInvocation)

- (SIMethodSignature *)si_methodSignatureForSelector:(SEL)aSelector;
+ (SIMethodSignature *)si_instanceMethodSignatureForSelector:(SEL)aSelector;

@end

NS_ASSUME_NONNULL_END
