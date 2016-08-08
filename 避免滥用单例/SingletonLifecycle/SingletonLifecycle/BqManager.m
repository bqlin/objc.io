//
//  BqManager.m
//  SingletonLifecycle
//
//  Created by LinBq on 16/8/8.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "BqManager.h"

@implementation BqManager
BqSingletonM(Manager)

- (void)dealloc{
	NSLog(@"%s", __FUNCTION__);
}

- (void)teardown{
	_instance = nil;
}

@end
