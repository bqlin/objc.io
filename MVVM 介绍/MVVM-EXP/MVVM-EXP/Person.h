//
//  Person.h
//  MVVM-EXP
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, readonly) NSString *salutation;
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSDate *birthday;

- (instancetype)initWithSalution:(NSString *)salutation firstName:(NSString *)firstName lastName:(NSString *)lastName birthday:(NSDate *)birthday;

@end
