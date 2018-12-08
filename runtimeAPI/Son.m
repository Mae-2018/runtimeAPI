//
//  Son.m
//  runtimeAPI
//
//  Created by Mae on 2018/12/7.
//  Copyright © 2018年 刘静冉. All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>

@implementation Son
- (instancetype)mutableCopyWithZone:(NSZone *)zone{
    Son *father = [Son new];
    unsigned int count;
    Ivar *ivars = class_copyIvarList([father class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSMutableString *key = [NSMutableString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [father setValue:value forKey:key];
    }
    free(ivars);
    return father;
}
- (void)sonSelector{
    NSLog(@"%s",__func__);
}
@end
