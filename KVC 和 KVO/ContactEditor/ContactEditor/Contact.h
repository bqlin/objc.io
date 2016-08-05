//
//  Contact.h
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;

+ (instancetype)contactWithRancomName;

@end
