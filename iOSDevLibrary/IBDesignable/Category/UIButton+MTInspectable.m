//
//  UIButton+MTInspectable.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/12.
//

#import "UIButton+MTInspectable.h"
#import <objc/runtime.h>

@implementation UIButton (MTInspectable)

#pragma mark - Getter and Setter
- (UIColor *)backgroundColorForNormal {
    return [UIButton primaryColor:[self backgroundImageForState:UIControlStateNormal]];
}

- (void)setBackgroundColorForNormal:(UIColor *)backgroundColorForNormal {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColorForNormal] forState:UIControlStateNormal];
}

- (UIColor *)backgroundColorForHighlighted {
    return [UIButton primaryColor:[self backgroundImageForState:UIControlStateHighlighted]];
}

- (void)setBackgroundColorForHighlighted:(UIColor *)backgroundColorForHighlighted {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColorForHighlighted] forState:UIControlStateHighlighted];
}

- (UIColor *)backgroundColorForDisabled {
    return [UIButton primaryColor:[self backgroundImageForState:UIControlStateDisabled]];
}

- (void)setBackgroundColorForDisabled:(UIColor *)backgroundColorForDisabled {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColorForDisabled] forState:UIControlStateDisabled];
}

- (UIColor *)backgroundColorForSelected {
    return [UIButton primaryColor:[self backgroundImageForState:UIControlStateSelected]];
}

- (void)setBackgroundColorForSelected:(UIColor *)backgroundColorForSelected {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColorForSelected] forState:UIControlStateSelected];
}

#pragma mark - Private
/** 根据图片获取图片的主色调 */
+ (UIColor *)primaryColor:(UIImage *)image{
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake(image.size.width / 2.0, image.size.height / 2.0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,    // bits per component
                                                 thumbSize.width * 4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char *data = CGBitmapContextGetData(context);
    if (data == NULL) return nil;
    NSCountedSet *cls = [NSCountedSet setWithCapacity:thumbSize.width * thumbSize.height];
    
    for (int x = 0; x < thumbSize.width; x ++) {
        for (int y = 0; y < thumbSize.height; y ++) {
            int offset = 4 * (x * y);
            int red = data[offset];
            int green = data[offset + 1];
            int blue = data[offset + 2];
            int alpha = data[offset + 3];
            if (alpha > 0) {    // 去除透明
                if (red == 255 && green == 255 && blue == 255) {    // 去除白色
                } else {
                    NSArray *clr = @[@(red), @(green), @(blue), @(alpha)];
                    [cls addObject:clr];
                }
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor = nil;
    NSUInteger MaxCount = 0;
    while ((curColor = [enumerator nextObject]) != nil) {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if (tmpCount < MaxCount) continue;
        MaxCount = tmpCount;
        MaxColor = curColor;
        
    }
    return [UIColor colorWithRed:([MaxColor[0] intValue] / 255.0f) green:([MaxColor[1] intValue] / 255.0f) blue:([MaxColor[2] intValue] / 255.0f) alpha:([MaxColor[3] intValue] / 255.0f)];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0, 0.0, 30.0, 30.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}


@end
