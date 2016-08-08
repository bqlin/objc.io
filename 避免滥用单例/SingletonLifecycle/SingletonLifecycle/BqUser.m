//
//  BqUser.m
//  SingletonLifecycle
//
//  Created by LinBq on 16/8/8.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "BqUser.h"
#import "BqManager.h"

@implementation BqUser

- (instancetype)init{
	if (self = [super init]) {
		_manager = [BqManager sharedManager];
	}
	return self;
}

- (void)dealloc{
	[self.manager teardown];
	NSLog(@"%s", __FUNCTION__);
}

@end
