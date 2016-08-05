//
//  ContactList.h
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactList : NSObject

@property (nonatomic, readonly) NSMutableOrderedSet *contacts;

+ (instancetype)sharedContactList;

@end
