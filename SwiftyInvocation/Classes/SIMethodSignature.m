//
//  SIMethodSignature.m
//  Pods
//
//  Created by Piotr Tobolski on 12.03.2017.
//
//

#import "SIMethodSignature.h"
#import "SIMethodSignature_Private.h"

@implementation SIMethodSignature {
    NSMethodSignature *_methodSignature;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"signatureWithObjCTypes:" reason:nil userInfo:nil];
}

- (instancetype)initWithMethodSignature:(NSMethodSignature *)methodSignature {
    if (self = [super init]) {
        _methodSignature = methodSignature;
    }
    return self;
}

- (instancetype)initWithObjCTypes:(const char *)types {
    return [self initWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:types]];
}

+ (nullable SIMethodSignature *)signatureWithObjCTypes:(const char *)types {
    return [[SIMethodSignature alloc] initWithObjCTypes:types];
}

- (NSUInteger)numberOfArguments {
    return _methodSignature.numberOfArguments;
}

- (const char *)getArgumentTypeAtIndex:(NSUInteger)idx {
    return [_methodSignature getArgumentTypeAtIndex:idx];
}

- (NSUInteger)frameLength {
    return [_methodSignature frameLength];
}

- (BOOL)isOneway {
    return [_methodSignature isOneway];
}

- (const char *)methodReturnType {
    return [_methodSignature methodReturnType];
}

- (NSUInteger)methodReturnLength {
    return [_methodSignature methodReturnLength];
}

- (NSMethodSignature *)underlyingMethodSignature {
    return _methodSignature;
}

@end
