//
//  KeyValueObserver.m
//  LabColorSpaceExplorer
//
//  Created by LinBq on 16/8/3.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "KeyValueObserver.h"


@interface KeyValueObserver ()

@property (nonatomic, weak) id observedObject;
@property (nonatomic, copy) NSString *keyPath;

@end

@implementation KeyValueObserver

- (id)initWithObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options{
	if (!object) return nil;
	NSParameterAssert(target);
	NSParameterAssert([target respondsToSelector:selector]);
	
	if (self = [super init]) {
		_target = target;
		_selector = selector;
		_observedObject = object;
		_keyPath = keyPath;
		[object addObserver:self forKeyPath:keyPath options:options context:(__bridge void *)(self)];
	}
	return self;
}

+ (NSObject *)observerObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector{
	return [self observerObject:object keyPath:keyPath target:target selector:selector options:0];
}

+ (NSObject *)observerObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options{
	return [[self alloc] initWithObject:object keyPath:keyPath target:target selector:selector options:options];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
	if (context == (__bridge void*)(self)) {
		[self didChange:change];
	}
}

- (void)didChange:(NSDictionary *)change{
	id strongTarget = self.target;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	[strongTarget performSelector:self.selector withObject:change];
#pragma clang diagnostic pop
}

- (void)dealloc{
	[self.observedObject removeObserver:self forKeyPath:self.keyPath];
	NSLog(@"%s", __FUNCTION__);
}
@end
