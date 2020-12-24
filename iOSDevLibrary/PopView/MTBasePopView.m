//
//  MTBasePopView.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/22.
//

#import "MTBasePopView.h"


@interface MTBasePopView ()

/// 遮挡
@property(nonatomic,strong)UIView *backShadeView;

@end

@implementation MTBasePopView

+(instancetype)popViewWithTitle:(NSString *)title message:(NSString *)message {
    MTBasePopView *basePop = [[MTBasePopView alloc] initWithTitle:title message:message];
    return basePop;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.actions = [NSMutableArray array];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.actions = [NSMutableArray array];
}


#pragma mark - getter

-(UIView *)backShadeView {
    if (!_backShadeView) {
        _backShadeView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backShadeView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _backShadeView;
}

#pragma mark - custom method

-(void)addAction:(MTPopAction *)action {
    
}

-(void)show {
    UIWindow *window = [self getWindow];
    
    for (UIView *subView in window.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            return;
        }
    }

   // self.center = window.center;
    [window addSubview:self.backShadeView];
    [self.backShadeView addSubview:self];
    self.center = CGPointMake(window.center.x, window.center.y + [[UIScreen mainScreen] bounds].size.height);
    [UIView animateWithDuration:0.4 animations:^{
        self.center = window.center;
    }];
}

-(void)hidden {
    UIWindow *window = [self getWindow];
    [UIView animateWithDuration:0.4 animations:^{
        self.center = CGPointMake(window.center.x, window.center.y + [[UIScreen mainScreen] bounds].size.height);
    } completion:^(BOOL finished) {
        [self.backShadeView removeFromSuperview];
    }];
}

#pragma mark - 获取窗口

-(UIWindow*)getWindow {
    
    UIWindow* win = nil; //[UIApplication sharedApplication].keyWindow;
    for (id item in [UIApplication sharedApplication].windows) {
        if ([item class] == [UIWindow class]) {
            if (!((UIWindow*)item).hidden) {
                win = item;
                break;
            }
        }
    }
    return win;
}


@end
