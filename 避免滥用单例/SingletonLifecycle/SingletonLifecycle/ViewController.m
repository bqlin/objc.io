//
//  ViewController.m
//  SingletonLifecycle
//
//  Created by LinBq on 16/8/8.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "ViewController.h"
#import "BqUser.h"


@interface ViewController ()

@property (nonatomic, strong) BqUser *instance;

@end

@implementation ViewController

- (void)dealloc{
	NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.instance = [[BqUser alloc] init];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
