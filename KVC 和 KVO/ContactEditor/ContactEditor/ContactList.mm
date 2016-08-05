//
//  ContactList.m
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <vector>
#import <algorithm>
#import "ContactList.h"
#import "Contact.h"

@implementation ContactList
{
	std::vector<__strong Contact *> _contacts;
}

+ (instancetype)sharedContactList{
	static ContactList *sharedList;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedList = [[ContactList alloc] init];
	});
	return sharedList;
}

- (instancetype)init{
	if (self = [super init]) {
		[self insertRandomContacts];
	}
	return self;
}

- (void)insertRandomContacts{
	for (int i = 0; i < 42; i++) {
		[self.contacts addObject:[Contact contactWithRancomName]];
	}
}

// 我们将通过 KVC 实现
- (NSMutableOrderedSet *)contacts{
	return [self mutableOrderedSetValueForKey:@"backingContacts"];
}

//
// 注意：该代码并不是一种推荐的实现方式。它仅仅只是一种可能的例子，并且如何自定义 backing KVC 是基于集合代理对象
//

- (NSUInteger)countOfBackingContacts{
	return _contacts.size();
}

- (NSUInteger)indexInBackingContactsOfObject:(id)object{
	auto i = std::find(_contacts.cbegin(), _contacts.cend(), object);
	return (i == _contacts.end()) ? NSNotFound : (i - _contacts.cbegin());
}

- (NSArray *)backingContactsAtIndexes:(NSIndexSet *)indexes{
	std::vector<Contact *> objects(indexes.count, nil);
	__block auto it = objects.begin();
	[indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
		*(it++) = _contacts[idx];
	}];
	return [NSArray arrayWithObjects:objects.data() count:objects.size()];
}

- (void)getBackingContacts:(id __unsafe_unretained [])buffer range:(NSRange)range{
	std::vector<Contact *> objects(range.length, nil);
	auto it1 = objects.begin();
	std::for_each(_contacts.cbegin() + range.location, _contacts.cbegin() + range.location + range.length, [&](Contact * const c){
		*(it1 ++) = c;
	});
}

- (void)insertBackingContacts:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
	__block NSUInteger idx1 = 0;
	[indexes enumerateIndexesUsingBlock:^(NSUInteger idx2, BOOL * _Nonnull stop) {
		id object = array[idx1 ++];
		_contacts.insert(_contacts.begin() + idx2, object);
	}];
}

- (void)removeBackingContactsAtIndexes:(NSIndexSet *)indexes{
	[indexes enumerateRangesWithOptions:NSEnumerationReverse usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
		_contacts.erase(_contacts.begin() + range.location, _contacts.begin() + range.location + range.length);
	}];
}

@end
