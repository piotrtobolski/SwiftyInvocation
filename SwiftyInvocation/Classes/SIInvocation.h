//
//  SIInvocation.h
//  SwiftyInvocation
//
//  Created by Piotr Tobolski on 12.03.2017.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SIMethodSignature;

@interface SIInvocation : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (SIInvocation *)invocationWithMethodSignature:(SIMethodSignature *)sig;

@property (readonly, retain) SIMethodSignature *methodSignature;

- (void)retainArguments;
@property (readonly) BOOL argumentsRetained;

@property (nullable, assign) id target;
@property SEL selector;

- (void)getReturnValue:(nullable void *)retLoc;
- (void)setReturnValue:(nullable void *)retLoc;

- (void)getArgument:(nullable void *)argumentLocation atIndex:(NSInteger)idx;
- (void)setArgument:(nullable void *)argumentLocation atIndex:(NSInteger)idx;

- (void)invoke;
- (void)invokeWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
