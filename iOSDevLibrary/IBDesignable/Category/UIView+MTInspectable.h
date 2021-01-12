//
//  UIView+MTInspectable.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MTInspectable)

/** 设置超过子图层的部分裁减掉 */
@property (assign, nonatomic) IBInspectable BOOL masksToBounds;
/** 圆角 */
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
/** 边框宽度 */
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
/** 边框颜色 */
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

/** 阴影颜色 */
@property (strong, nonatomic) IBInspectable UIColor *shadowColor;
/** 阴影透明度 */
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
/** 阴影偏移 */
@property (assign, nonatomic) IBInspectable CGSize shadowOffset;
/** 阴影圆角 */
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;


@end

NS_ASSUME_NONNULL_END
