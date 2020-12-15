//
//  UIView+HitArea.m
//  AntFinancialDemo
//
//  Created by Jason on 3/10/16.
//  Copyright © 2016年 CSII
//

#import "UIView+HitArea.h"
#import <objc/message.h>

void Swizzle(Class c, SEL orig, SEL new) {
    
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}


@implementation UIView (HitArea)

+ (void)load {
    Swizzle(self, @selector(pointInside:withEvent:), @selector(myPointInside:withEvent:));
}

- (BOOL)myPointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || self.hidden ||
       ([self isKindOfClass:UIControl.class] && !((UIControl*)self).enabled))
    {
        return [self myPointInside:point withEvent:event]; // original implementation
    }
    CGRect hitFrame = UIEdgeInsetsInsetRect(self.bounds, self.hitTestEdgeInsets);
    hitFrame.size.width = MAX(hitFrame.size.width, 0); // don't allow negative sizes
    hitFrame.size.height = MAX(hitFrame.size.height, 0);
    return CGRectContainsPoint(hitFrame, point);
}

static char hitTestEdgeInsetsKey;
- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    objc_setAssociatedObject(self, &hitTestEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:hitTestEdgeInsets], OBJC_ASSOCIATION_RETAIN);
}

- (UIEdgeInsets)hitTestEdgeInsets {
    return [objc_getAssociatedObject(self, &hitTestEdgeInsetsKey) UIEdgeInsetsValue];
}

@end
