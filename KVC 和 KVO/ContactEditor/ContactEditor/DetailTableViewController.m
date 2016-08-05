//
//  DetailTableViewController.m
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "DetailTableViewController.h"
#import "Contact.h"

@interface DetailTableViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation DetailTableViewController

- (void)setContact:(Contact *)contact{
	_contact = contact;
	[self updateTextFields];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[self updateTextFields];
}

- (NSArray *)contactStringKeys{
	return @[@"name", @"phone", @"email"];
}

- (UITextField *)textFieldForModelKey:(NSString *)key{
	return [self valueForKey:[key stringByAppendingString:@"Field"]];
}

- (void)updateTextFields{
	for (NSString *key in self.contactStringKeys) {
		[self textFieldForModelKey:key].text = [self.contact valueForKey:key];
	}
}

- (IBAction)fieldEditingDidEnd:(UITextField *)sender {
	for (NSString *key in self.contactStringKeys) {
		UITextField *field = [self textFieldForModelKey:key];
		if (field == sender) {
			id value = sender.text;
			NSError *error = nil;
			if ([self.contact validateValue:&value forKey:key error:&error]) {
				[self.contact setValue:value forKey:key];
			}else{
				NSLog(@"错误：%@", error);
			}
			sender.text = value;
			break;
		}
	}
}
- (IBAction)done:(UIBarButtonItem *)sender {
	[self.view endEditing:YES];
	[self dismissViewControllerAnimated:YES completion:^{}];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	if (textField == self.nameField) {
		[self.phoneField becomeFirstResponder];
	}else if (textField == self.phoneField){
		[self.emailField becomeFirstResponder];
	}else{
		[textField resignFirstResponder];
	}
	return YES;
}

@end
