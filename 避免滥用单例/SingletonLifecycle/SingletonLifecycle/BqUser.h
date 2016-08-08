//
//  BqUser.h
//  SingletonLifecycle
//
//  Created by LinBq on 16/8/8.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BqManager;

@interface BqUser : NSObject

@property (nonatomic, readonly) BqManager *manager;

@end
