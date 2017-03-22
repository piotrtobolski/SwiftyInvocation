//
//  SIInvocation.m
//  SwiftyInvocation
//
//  Created by Piotr Tobolski on 12.03.2017.
//
//

#import "SIInvocation.h"
#import "SIMethodSignature.h"
#import "SIMethodSignature_Private.h"

@implementation SIInvocation {
    NSInvocation *_invocation;
    SIMethodSignature *_methodSignature;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"invocationWithMethodSignature:" reason:nil userInfo:nil];
}

- (instancetype)initWithMethodSignature:(SIMethodSignature *)sig {
    if (self = [super init]) {
        _methodSignature = sig;
        _invocation = [NSInvocation invocationWithMethodSignature:sig.underlyingMethodSignature];
    }
    return self;
}

+ (SIInvocation *)invocationWithMethodSignature:(SIMethodSignature *)sig {
    return [[SIInvocation alloc] initWithMethodSignature:sig];
}

- (SIMethodSignature *)methodSignature {
    return _methodSignature;
}

- (void)retainArguments {
    [_invocation retainArguments];
}

- (BOOL)argumentsRetained {
    return [_invocation argumentsRetained];
}

- (id)target {
    return _invocation.target;
}

- (void)setTarget:(id)target {
    _invocation.target = target;
}

- (SEL)selector {
    return _invocation.selector;
}

- (void)setSelector:(SEL)selector {
    _invocation.selector = selector;
}

- (void)getReturnValue:(void *)retLoc {
    [_invocation getReturnValue:retLoc];
}

- (void)setReturnValue:(void *)retLoc {
    [_invocation setReturnValue:retLoc];
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [_invocation getArgument:argumentLocation atIndex:idx];
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx {
    [_invocation setArgument:argumentLocation atIndex:idx];
}

- (void)invoke {
    [_invocation invoke];
}

- (void)invokeWithTarget:(id)target {
    [_invocation invokeWithTarget:target];
}

@end
