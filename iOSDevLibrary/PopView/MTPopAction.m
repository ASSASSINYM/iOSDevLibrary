//
//  MTPopAction.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/24.
//

#import "MTPopAction.h"

@interface MTPopAction ()

@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)MTActionStyle style;
@property(nonatomic,copy)ActionhHandler handler;

@end

@implementation MTPopAction

+(instancetype)actionWithTitle:(NSString *)title style:(MTActionStyle)style handler:(ActionhHandler)handler {
    
    MTPopAction *action = [[MTPopAction alloc] initWithTitle:title style:style handler:handler];
    return action;
}

-(instancetype)initWithTitle:(NSString *)title style:(MTActionStyle)style  handler:(ActionhHandler)handler {
    if (self = [super init]) {
        self.title = title;
        self.style = style;
        self.handler = handler;
    }
    return self;
}

@end
