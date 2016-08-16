//
//  PersonViewModel.h
//  MVVM-EXP
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonViewModel : NSObject

@property (nonatomic, readonly) Person *person;
@property (nonatomic, readonly) NSString *nameText;
@property (nonatomic, readonly) NSString *birthdayText;

- (instancetype)initWithPerson:(Person *)person;

@end
