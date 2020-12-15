//
//  UITableView+CellAnimation.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,CustomAnimation){
    CustomAnimationTypeMove,        //左侧飞入
    CustomAnimationTypeAlpha,       //透明
    CustomAnimationTypeFall,        //上面掉落
    CustomAnimationTypeShaKe,       //抖动动画
    CustomAnimationTypeOverTurn,    //翻转动画
    CustomAnimationTypeToTop,       //从下往上
    CustomAnimationTypeSpringList,  //从上往下弹动动画
    CustomAnimationTypeShrinkToTop, //从下往上挤向顶部
    CustomAnimationTypeLayDown,     //从上往下展开
    CustomAnimationTypeRote,        //翻转动画
};

@interface UITableView (CellAnimation)

/**
 *  UItableView 显示动画
 *
 *  @param type 动画类型
 */
- (void) customAnimation:(CustomAnimation)type;

@end

NS_ASSUME_NONNULL_END
