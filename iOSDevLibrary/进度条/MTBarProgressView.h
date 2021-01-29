//
//  MTBarProgressView.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/29.
//

#import "MTProgressBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MTBarProgressView : MTProgressBaseView

/// 进度条背景颜色
@property(nonatomic,strong)UIColor *bgColor;
/// 进度条颜色
@property(nonatomic,strong)UIColor *progressBarColor;

@end

NS_ASSUME_NONNULL_END
