//
//  UIColor+MTColor.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MTColor)


/// 随机色
+ (UIColor *)randColor;

/// 16进制颜色
/// @param colorStr 16进制字符串
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha;

/// RGB
/// @param r 0-255
/// @param g 0-255
/// @param b 0-255
/// @param a 0-100
+(UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;


@end

NS_ASSUME_NONNULL_END
