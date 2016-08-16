//
//  Person.m
//  MVVM-EXP
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithSalution:(NSString *)salutation firstName:(NSString *)firstName lastName:(NSString *)lastName birthday:(NSDate *)birthday{
	if (self = [super init]) {
		_salutation = salutation;
		_firstName = firstName;
		_lastName = lastName;
		_birthday = birthday;
	}
	return self;
}
@end
