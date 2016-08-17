//
//  Photo.h
//  PotoData-Exp
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Photo : NSObject

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, assign) double rating;
@property (nonatomic, weak) User *user;

- (NSString *)authorFullName;
- (double)adjustedRating;

@end
