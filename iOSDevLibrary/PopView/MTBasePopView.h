//
//  MTBasePopView.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/22.
//

#import <UIKit/UIKit.h>
#import "MTPopAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTBasePopView : UIView

/// 标题
@property(nonatomic,copy)NSString *title;
/// 内容
@property(nonatomic,copy)NSString *message;
///
@property(nonatomic,strong)NSMutableArray *actions;


/// 初始化方法
/// @param title 标题
/// @param message 内容
+(instancetype)popViewWithTitle:(NSString *)title message:(NSString *)message;

/// 添加操作
/// @param action 操作
-(void)addAction:(MTPopAction *)action;

/// 显示
-(void)show;
/// 隐藏
-(void)hidden;

@end

NS_ASSUME_NONNULL_END
