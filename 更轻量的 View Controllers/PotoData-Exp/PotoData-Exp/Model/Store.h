//
//  Store.h
//  PotoData-Exp
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (nonatomic, readonly) NSArray *photos;
@property (nonatomic, readonly) NSArray *users;

- (NSArray *)storedPhotos;

+ (instancetype)store;

@end
