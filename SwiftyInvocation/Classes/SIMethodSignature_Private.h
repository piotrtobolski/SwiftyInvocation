//
//  SIMethodSignature_Private.h
//  Pods
//
//  Created by Piotr Tobolski on 12.03.2017.
//
//

@interface SIMethodSignature ()

@property (readonly, nonatomic) NSMethodSignature *underlyingMethodSignature;
- (instancetype)initWithMethodSignature:(NSMethodSignature *)methodSignature;

@end
