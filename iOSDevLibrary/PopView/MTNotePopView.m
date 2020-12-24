//
//  MTNotePopView.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/22.
//

#import "MTNotePopView.h"

@implementation MTNotePopView

+(instancetype)popViewWithTitle:(NSString *)title message:(NSString *)message {
    MTNotePopView *pop = [[[NSBundle mainBundle] loadNibNamed:@"MTNotePopView" owner:nil options:nil] lastObject];
    pop.title = title;
    pop.message = message;
    return pop;
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(void)show {
    [super show];
}

@end
