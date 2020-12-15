//
//  MTCheckBoxBtn.m
//  TibetBankDemo
//
//  Created by ASSASSIN on 2020/12/10.
//

#import "MTCheckBoxBtn.h"
#import "UIButton+MTEnlargeTouchArea.h"
#import "UIColor+MTColor.h"

@interface MTCheckBoxBtn ()

@property(nonatomic,copy)void(^block)(BOOL isChecked);

@end

@implementation MTCheckBoxBtn


+(instancetype)initCheckBoxWithFrame:(CGRect)frame block:(void (^)(BOOL))block {
    MTCheckBoxBtn *btn = [[MTCheckBoxBtn alloc] initWithFrame:frame];
    btn.block = block;
    return btn;
}

+(instancetype)initCheckBoxWithBlock:(void (^)(BOOL))block {
    MTCheckBoxBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"" owner:nil options:nil] lastObject];
    btn.block = block;
    return btn;
}


-(void)checkBoxClickBlock:(void (^)(BOOL))block {
    self.block = block;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.checked = NO;
    self.normalColor = [UIColor lightGrayColor];
//    self.selectedColor = [RGBCOLOR(79, 128, 241, 1)];
    self.selectedColor = [UIColor colorWithR:79 g:128 b:241 a:100];
    
    [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.checked = NO;
        self.normalColor = [UIColor lightGrayColor];
    //    self.selectedColor = [RGBCOLOR(79, 128, 241, 1)];
        self.selectedColor = [UIColor colorWithR:79 g:128 b:241 a:100];
        
        [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - action

-(void)btnClicked:(UIButton *)btn {
    self.checked = !self.checked;
    //刷新界面
    if (self.block) {
        
        
        self.block(self.checked);
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(checkBoxClicked:)]) {
        
        [self.delegate checkBoxClicked:self];
    }
    
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    
    if (self.checked) {
        if (self.type == MTCircleType) {
            //原型
            CGRect rect = self.bounds;
            CGRect rect1 = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4);
            UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:rect1];
            path1.lineWidth = 2;
            [self.selectedColor setStroke];
            [path1 stroke];
            
            CGRect rect2 = CGRectMake(rect1.origin.x + 4, rect1.origin.y + 4, rect1.size.width - 8, rect1.size.height - 8);
            UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:rect2];
            [self.selectedColor setFill];
            [path2 fill];
        }else {
            //方形
            CGRect rect = self.bounds;
            CGRect rect1 = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4);
            UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:rect1];
            path1.lineWidth = 2;
            [self.selectedColor setStroke];
            [path1 stroke];
            
            //勾号
            UIBezierPath *path2 = [UIBezierPath bezierPath];
            [path2 moveToPoint:CGPointMake(rect1.origin.x + 2, rect1.origin.y + rect1.size.height/2.0)];
            [path2 addLineToPoint:CGPointMake(rect1.origin.x + (rect1.size.width-4)/2.0, rect1.origin.y + rect1.size.height - 4)];
            [path2 addLineToPoint:CGPointMake(rect1.origin.x + rect1.size.width - 2, rect1.origin.y + 4)];
            path2.lineWidth = 4;
            path2.lineCapStyle = kCGLineCapRound;
            [self.selectedColor setStroke];
            [path2 stroke];
        }
    }else {
        //圆形
        if (self.type == MTCircleType) {
            CGRect rect = self.bounds;
            CGRect rect1 = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4);
            UIBezierPath *path1 = [UIBezierPath bezierPathWithOvalInRect:rect1];
            path1.lineWidth = 2;
            [self.normalColor setStroke];
            [path1 stroke];
        }else {
            //方形
            //方形
            CGRect rect = self.bounds;
            CGRect rect1 = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4);
            UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:rect1];
            path1.lineWidth = 2;
            [self.normalColor setStroke];
            [path1 stroke];
        }
    }
}

@end
