//
//  UITextField+MTInspectable.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/12.
//

#import "UITextField+MTInspectable.h"
#import <objc/runtime.h>

@implementation UITextField (MTInspectable)

- (UIColor *)placeholderColor {
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    return placeholderLabel.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self, ivar);
    placeholderLabel.textColor = placeholderColor;
}

- (CGFloat)leadingSpacing {
    return CGRectGetWidth(self.leftView.bounds);
}

- (void)setLeadingSpacing:(CGFloat)leadingSpacing {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leadingSpacing, self.bounds.size.height)];
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (CGFloat)taillingSpacing {
    return CGRectGetWidth(self.rightView.bounds);
}

- (void)setTaillingSpacing:(CGFloat)taillingSpacing {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, taillingSpacing, self.bounds.size.height)];
    self.rightView = view;
    self.rightViewMode = UITextFieldViewModeAlways;
}

@end
