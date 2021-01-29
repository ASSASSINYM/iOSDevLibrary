//
//  MTBarProgressView.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/29.
//

#import "MTBarProgressView.h"
#import "UIColor+MTColor.h"

@interface MTBarProgressView ()

@end

@implementation MTBarProgressView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self defaultConfigure];
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultConfigure];
        [self setNeedsDisplay];
    }
    return self;
}

-(void)defaultConfigure {
    self.backgroundColor = [UIColor colorWithHexString:@"#EDECF1" alpha:1];
    self.progressBarColor = [UIColor colorWithHexString:@"#21B7FF" alpha:1];
    self.progress = 0.0;
    self.layer.cornerRadius = self.bounds.size.height/2.0;
    self.clipsToBounds = YES;
}

-(void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

-(void)setProgressBarColor:(UIColor *)progressBarColor {
    _progressBarColor = progressBarColor;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = self.bounds.size.height;
    path.lineCapStyle = kCGLineCapRound;
    [self.progressBarColor setStroke];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height/2.0)];
    
    [path addLineToPoint:CGPointMake(self.progress * self.bounds.size.width, self.bounds.size.height/2.0)];
    [path stroke];

}

@end
