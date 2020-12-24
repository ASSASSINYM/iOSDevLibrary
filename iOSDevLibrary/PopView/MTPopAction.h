//
//  MTPopAction.h
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2020/12/24.
//

#import <Foundation/Foundation.h>
@class MTPopAction;

typedef NS_ENUM(NSInteger,MTActionStyle) {
    MTActionNormalStyle = 0,
    MTActionCancelStyle = 1
};

NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionhHandler)(MTPopAction *acton);



@interface MTPopAction : NSObject

+(instancetype)actionWithTitle:(NSString *)title style:(MTActionStyle)style handler:(ActionhHandler)handler;

@end

NS_ASSUME_NONNULL_END
