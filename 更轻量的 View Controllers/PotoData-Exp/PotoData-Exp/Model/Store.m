//
//  Store.m
//  PotoData-Exp
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "Store.h"
#import "Photo.h"

@implementation Store

+ (instancetype)store{
	return [[self alloc] init];
}

- (instancetype)init{
	if (self = [super init]) {
		[self readArchive];
	}
	return self;
}

- (void)readArchive{
	NSURL *archiveURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"photodata" withExtension:@"bin"];
	NSAssert(archiveURL != nil, @"找不到归档！");
	NSData *data = [NSData dataWithContentsOfURL:archiveURL options:0 error:NULL];
	NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
	_users = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
	_photos = [unarchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
	[unarchiver finishDecoding];
}

- (NSArray *)storedPhotos{
	
}

@end
