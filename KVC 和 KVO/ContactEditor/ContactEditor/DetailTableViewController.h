//
//  DetailTableViewController.h
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;

@interface DetailTableViewController : UITableViewController

@property (nonatomic, strong) Contact *contact;

@end
