//
//  MTCheckBoxBtn.h
//  TibetBankDemo
//
//  Created by ASSASSIN on 2020/12/10.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,MTCheckBoxType) {
    MTCircleType,
    MTSquareType
};

NS_ASSUME_NONNULL_BEGIN

@class MTCheckBoxBtn;

@protocol MTCheckBoxBtnDelegate <NSObject>

-(void)checkBoxClicked:(MTCheckBoxBtn *)checkBox;

@end

@interface MTCheckBoxBtn : UIButton

///是否勾选
@property(nonatomic,assign)BOOL checked;
///未勾选颜色
@property(nonatomic,strong)UIColor *normalColor;
///勾选颜色
@property(nonatomic,strong)UIColor *selectedColor;
///border 宽度
@property(nonatomic,assign)CGFloat borderWidth;

/// checkbox类型
@property(nonatomic,assign)MTCheckBoxType type;

@property(nonatomic,weak)id<MTCheckBoxBtnDelegate> delegate;


+(instancetype)initCheckBoxWithBlock:(void(^)(BOOL isChecked))block;

/// 自定义方法
/// @param block 点击回调
-(void)checkBoxClickBlock:(void(^)(BOOL isChecked))block;

@end

NS_ASSUME_NONNULL_END
