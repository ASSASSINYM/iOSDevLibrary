//
//  UIButton+MTEnlargeTouchArea.m
//  MobileCenter
//
//  Created by ASSASSIN on 2020/12/10.
//  Copyright © 2020 CSII-CD. All rights reserved.
//

#import "UIButton+MTEnlargeTouchArea.h"

// SDK
#import <objc/runtime.h>

static NSString * const MTEdgeInsetsKey = @"DRNHitExtensionHitEdgeInsetsKey";

@interface UIButton ()

@end

@implementation UIButton (MTEnlargeTouchArea)

@dynamic hitEdgeInsets;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL isZeroInsets = UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero);
    if (isZeroInsets || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    UIEdgeInsets reversedEdgeInsets = UIEdgeInsetsMake(-self.hitEdgeInsets.top,
                                                       -self.hitEdgeInsets.left,
                                                       -self.hitEdgeInsets.bottom,
                                                       -self.hitEdgeInsets.right);
    CGRect bounds = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(bounds, reversedEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - Setter

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets
{
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &MTEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getter

- (UIEdgeInsets)hitEdgeInsets
{
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &MTEdgeInsetsKey);
    if (edgeInsetsValue) {
        UIEdgeInsets edgeInsets;
        [edgeInsetsValue getValue:&edgeInsets];
        return edgeInsets;
    }
    
    return UIEdgeInsetsZero;
}

@end
