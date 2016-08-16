//
//  PersonViewModel.m
//  MVVM-EXP
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "PersonViewModel.h"

@implementation PersonViewModel

- (instancetype)initWithPerson:(Person *)person{
	if (self = [super init]) {
		_person = person;
		if (person.salutation.length > 0) {
			_nameText = [NSString stringWithFormat:@"%@ %@ %@", self.person.salutation, self.person.firstName, self.person.lastName];
		}else{
			_nameText = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
		}
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
		_birthdayText = [dateFormatter stringFromDate:person.birthday];
	}
	return self;
}
@end
