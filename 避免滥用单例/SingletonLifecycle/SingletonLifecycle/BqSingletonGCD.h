//
//  BqSingleton.h
//  Singleton
//
//  Created by LinBq on 16/1/26.
//  Copyright (c) 2016年 LinBq. All rights reserved.
//  单例的声明与实现，使用 GCD

#ifndef BqSingletonGCD_h
#define BqSingletonGCD_h

// *.h 文件
#define BqSingletonH(name) + (instancetype)shared##name;

// *.m 文件
#define BqSingletonM(name) \
static id _instance;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone{\
    return _instance;\
}\
+ (instancetype)shared##name{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
    });\
    return _instance;\
}

// ARC/MRC 处理
#if __has_feature(objc_arc) // ARC 环境
#else   // MRC 环境\
- (oneway void)release{ }\
- (instancetype)autorelease{ return self; }\
- (instancetype)retain{ return self; }\
- (NSUInteger)retainCount{ return 1; }
#endif

#endif
