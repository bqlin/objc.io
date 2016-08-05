//
//  ContactTableViewController.m
//  ContactEditor
//
//  Created by LinBq on 16/8/4.
//  Copyright © 2016年 BqLin. All rights reserved.
//

#import "ContactTableViewController.h"
#import "ContactList.h"
#import "Contact.h"
#import "DetailTableViewController.h"



@interface ContactTableViewController ()

@property (nonatomic, strong) ContactList *contactList;

@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.contactList = [ContactList sharedContactList];
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	// 我们需要在这里重新加载可视单元格，因为该详细视图可能会改变通讯录中的名称
	[self updateVisibleCells];
}

- (void)updateVisibleCells{
	for (UITableViewCell *cell in self.tableView.visibleCells) {
		NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
		Contact *contact = self.contactList.contacts[indexPath.row];
		if (cell.textLabel.text != contact.name) {
			[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
		}
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



@implementation ContactTableViewController (TableViewDataSourceAndDelegate)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.contactList.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contact" forIndexPath:indexPath];
	Contact *contact = self.contactList.contacts[indexPath.row];
	cell.textLabel.text = contact.name;
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[self.contactList.contacts removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	}else if (editingStyle == UITableViewCellEditingStyleInsert){
		[self.contactList.contacts insertObject:[Contact contactWithRancomName] atIndex:indexPath.row];
		[tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
	[self.contactList.contacts moveObjectsAtIndexes:[NSIndexSet indexSetWithIndex:sourceIndexPath.row] toIndex:destinationIndexPath.row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	DetailTableViewController *vc = segue.destinationViewController;
	vc.contact = self.contactList.contacts[self.tableView.indexPathForSelectedRow.row];
}

@end
