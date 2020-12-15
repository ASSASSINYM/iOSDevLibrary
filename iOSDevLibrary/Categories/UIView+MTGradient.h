//
//  UIView+MTGradient.h
//  MobileCenter
//
//  Created by ASSASSIN on 2020/12/9.
//  Copyright © 2020 CSII-CD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MTGradient)

@property(nonatomic, copy) NSArray *colors;
@property(nonatomic, copy) NSArray<NSNumber *> *locations;

@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint endPoint;

+ (UIView *_Nullable)gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

- (void)setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
