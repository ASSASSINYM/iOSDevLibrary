//
//  NSMutableArray+ErrorHandle.m
//  iOSDevLibrary
//
//  Created by ASSASSIN on 2021/1/7.
//

#import "NSMutableArray+ErrorHandle.h"
#import <objc/runtime.h>
#import "NSObject+SwizzleMethod.h"

@implementation NSMutableArray (ErrorHandle)

/**
 *  数组中插入数据
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index{
    if (index < self.count && object) {
        [self insertObject:object atIndex:index];
    }
}
/**
 *  数组中添加数据
 */
- (void)addObjectVerify:(id)object{
    if (object) {
        [self addObject:object];
    }
}

+(void)load{
    [super load];
    //无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换NSMutableArray中的方法
        [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jz_objectAtIndex:) error:nil];
        //交换NSMutableArray中的方法
        [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(jz_objectAtIndexedSubscript:) error:nil];
    });
}

- (id)jz_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self jz_objectAtIndex:index];
    }else{
        
        NSLog(@" 你的NSMutableArray数组已经越界 帮你处理好了%ld   %ld   %@", index, self.count, [self class]);
        return nil;
    }
}
- (id)jz_objectAtIndexedSubscript:(NSUInteger)index{
    if (index < self.count) {

        return [self jz_objectAtIndexedSubscript:index];
    }else{
        NSLog(@" 你的NSMutableArray数组已经越界 帮你处理好了%ld   %ld   %@", index, self.count, [self class]);
        return nil;
    }
}


@end
