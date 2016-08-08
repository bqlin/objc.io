//
//  BqManager.h
//  SingletonLifecycle
//
//  Created by LinBq on 16/8/8.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BqSingletonGCD.h"

@interface BqManager : NSObject
BqSingletonH(Manager)

- (void)teardown;

@end
