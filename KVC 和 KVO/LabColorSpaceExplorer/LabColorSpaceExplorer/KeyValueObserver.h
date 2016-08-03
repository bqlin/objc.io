//
//  KeyValueObserver.h
//  LabColorSpaceExplorer
//
//  Created by LinBq on 16/8/3.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueObserver : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic) SEL selector;

/// 创建一个键值监听助手对象
///
/// 只要该返回标记对象被保留，@c 对象的 KVO 通知和 @c 的键路径会让指定的 @c selector 在 @c target 中调用。
/// @a 对象 and @a target 都为弱引用.
/// 一旦标记对象被释放，该监听这会被移除。
///
/// 该 @c selector 该遵守
/// @code
/// - (void)nameDidChange:(NSDictionary *)change;
/// @endcode
/// 字典传递的是 KVO 改变字典（c.f. @c NSKeyValueChangeKindKey, @c NSKeyValueChangeNewKey etc.）
///
/// @returns 存储在属性的不透明标记对象
///
/// 例子：
///
/// @code
///   self.nameObserveToken = [KeyValueObserver observeObject:user
///                                                   keyPath:@"name"
///                                                    target:self
///                                                  selector:@selector(nameDidChange:)];
/// @endcode
+ (NSObject *)observerObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result));

/// 创建一个带 KVO 选项的键值监听者
+ (NSObject *)observerObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));
@end
