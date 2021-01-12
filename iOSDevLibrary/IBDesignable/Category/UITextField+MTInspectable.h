//
//  UITextField+MTInspectable.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (MTInspectable)

/** placeholder 颜色 */
@property (strong, nonatomic) IBInspectable UIColor *placeholderColor;

/** UITextField 的边框左侧和文字左侧的距离 */
@property (assign, nonatomic) IBInspectable CGFloat leadingSpacing;
/** UITextField 的边框右侧和文字右侧的距离 */
@property (assign, nonatomic) IBInspectable CGFloat taillingSpacing;


@end

NS_ASSUME_NONNULL_END
