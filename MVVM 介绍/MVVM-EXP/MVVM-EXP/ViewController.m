//
//  ViewController.m
//  MVVM-EXP
//
//  Created by LinBq on 16/8/16.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "ViewController.h"
#import "PersonViewModel.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *birthdayView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	Person *person = [[Person alloc] initWithSalution:@"Dr." firstName:@"Bq" lastName:@"Lin" birthday:[NSDate date]];
	PersonViewModel *viewModel = [[PersonViewModel alloc] initWithPerson:person];
	self.nameView.text = viewModel.nameText;
	self.birthdayView.text = viewModel.birthdayText;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
