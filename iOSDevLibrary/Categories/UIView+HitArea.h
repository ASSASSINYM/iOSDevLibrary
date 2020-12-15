//
//  UIView+HitArea.h
//  AntFinancialDemo
//
//  Created by Jason on 3/10/16.
//  Copyright © 2016年 CSII
//

#import <UIKit/UIKit.h>

/**
 *  扩大UIView点击响应区域
 */
@interface UIView (HitArea)

@property(nonatomic) UIEdgeInsets hitTestEdgeInsets;

@end
