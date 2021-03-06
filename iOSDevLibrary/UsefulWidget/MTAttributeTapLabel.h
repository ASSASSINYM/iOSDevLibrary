//
//  MTAttributeTapLabel.h
//  MobileCenter
//
//  Created by ASSASSIN on 2020/12/10.
//  Copyright © 2020 CSII-CD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MTAttributeTapLabelTapBlock)(NSString * string);

@interface MTAttributeModel : NSObject
@property (nonatomic, copy) NSString    * string;   //高亮字符串
@property (nonatomic, strong) UIImage   * alertImg; //高粱字符串后跟提示图片
@property (nonatomic, assign) NSRange   range;      //字符串位置
@property (nonatomic, strong) NSDictionary  * attributeDic; //富文本颜色字体等配置
@end

@interface MTAttributeTapLabel : UILabel

@property (nonatomic, copy) MTAttributeTapLabelTapBlock tapBlock;   //目标点击回调

/**
 设置文本
 
 @param text 文本内容
 @param attr 富文本样式 （样式中务必设置字体，若使用系统默认字体可能导致点击无响应或者响应混乱）
 @param stringArray 需要处理点击的文本
 */
- (void)setText:(NSString *)text attributes:(NSDictionary *)attr tapStringArray:(NSArray <MTAttributeModel *>*)stringArray;

@end

NS_ASSUME_NONNULL_END
