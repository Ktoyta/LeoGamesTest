//
//  LGTMainViewController.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 07.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTMainViewController.h"
#import "LGTHeaderViewController.h"
#import "LGTAccountManagementViewController.h"
#import "LGTSearchViewController.h"
#import "LGTAccountItem.h"
#import "LGTTableViewCell.h"

static id<LGTAccountRepresentation> item(NSString *title, NSString *subtitle, UIImage *icon)
{
	return [[LGTAccountItem alloc] initWithTitle:title subtitle:subtitle icon:icon];
}

static id<LGTAccountRepresentation> chosenItem(NSString *title, NSString *subtitle, UIImage *icon)
{
	LGTAccountItem *item = [[LGTAccountItem alloc] initWithTitle:title subtitle:subtitle icon:icon];
	item.chosen = YES;
	return item;
}

@interface LGTMainViewController () <UITableViewDataSource, UITableViewDelegate, LGTHeaderViewControllerDelegate, LGTAccountManagementViewControllerDelegate, LGTSearchViewControllerDelegate, UITabBarDelegate>

@property (nonatomic, strong, readwrite) IBOutlet UITabBar *footerView;
@property (nonatomic, strong, readwrite) IBOutlet UIView *headerView;
@property (nonatomic, weak, readwrite) IBOutlet UITableView *tableView;


@property (nonatomic, strong, readonly) NSArray<id<LGTAccountRepresentation>> *unknownItems; //¯\＿(ツ)＿/¯
@property (nonatomic, strong, readonly) NSArray<id<LGTAccountRepresentation>> *chosenItems;
@property (nonatomic, strong, readonly) NSArray<id<LGTAccountRepresentation>> *lastItems;

@end

@implementation LGTMainViewController
{
	NSArray<id<LGTAccountRepresentation>> *_unknownItems;
	NSArray<id<LGTAccountRepresentation>> *_chosenItems;
	NSArray<id<LGTAccountRepresentation>> *_lastItems;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
	self.tableView.tableHeaderView = self.headerView;
	self.tableView.tableFooterView = self.footerView;
	self.footerView.delegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[LGTHeaderViewController class]])
	{
		((LGTHeaderViewController *)segue.destinationViewController).delegate = self;
	}
	else if ([segue.destinationViewController isKindOfClass:[LGTAccountManagementViewController class]])
	{
		((LGTAccountManagementViewController *)segue.destinationViewController).delegate = self;
	}
	else if ([segue.destinationViewController isKindOfClass:[LGTSearchViewController class]])
	{
		((LGTSearchViewController *)segue.destinationViewController).delegate = self;
	}
}

- (NSArray<id<LGTAccountRepresentation>> *)unknownItems
{
	if (_unknownItems == nil)
	{
		_unknownItems = @[item(@"Кирилл", @"+38(063)2018542", [UIImage imageNamed:@"accountIcon"])];
	}
	return _unknownItems;
}

- (NSArray<id<LGTAccountRepresentation>> *)chosenItems
{
	if (_chosenItems == nil)
	{
		_chosenItems = @[chosenItem(@"4567 45** **** 2341", nil, [UIImage imageNamed:@"accountIcon"]),
						  chosenItem(@"Триолан", @"5657****2345", [UIImage imageNamed:@"accountIcon"]),
						  chosenItem(@"Андрей Коллега", @"380956069011", [UIImage imageNamed:@"accountIcon"]),
						  chosenItem(@"4567 45** **** 2341", nil, [UIImage imageNamed:@"accountIcon"])];
	}
	return _chosenItems;
}

- (NSArray<id<LGTAccountRepresentation>> *)lastItems
{
	if (_lastItems == nil)
	{
		_lastItems = @[item(@"Сын маминой подруги", @"+38(063)2018542", [UIImage imageNamed:@"accountIcon"]),
						 item(@"Жена", @"4567 45** **** 2341", [UIImage imageNamed:@"accountIcon"]),
						 item(@"Мама", @"3527 12** **** 5327", [UIImage imageNamed:@"accountIcon"])];
	}
	return _lastItems;
}

#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	[self presentInformationAlertWithTitle:@"Tab Item Selected" message:item.title.capitalizedString];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
	LGTTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[self presentInformationAlertWithTitle:cell.representedObject.title message:cell.representedObject.subtitle];
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	LGTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
	
	NSUInteger currentIndex = indexPath.row;
	NSArray *arrays = @[self.unknownItems, self.chosenItems, self.lastItems];
	NSArray *sections = @[@"Избранное", @"Последнее"];
	NSArray *currentArray = nil;
	NSString *section = nil;
	BOOL last = NO;
	
	for (int i = 0; i < arrays.count; i++)
	{
		currentArray = arrays[i];
		if (currentIndex < currentArray.count)
		{
			if (currentIndex == currentArray.count - 1)
			{
				 if (i < sections.count)
				 {
					 section = sections[i];
				 }
				else
				{
					last = YES;
				}
			}
			break;
		}
		else
		{
			currentIndex -= currentArray.count;
		}
	}
	
	cell.representedObject = currentArray[currentIndex];
	cell.section = section;
	cell.hideSeparator = last;
	
	return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.unknownItems.count + self.chosenItems.count + self.lastItems.count;
}

#pragma mark - LGTHeaderViewControllerDelegate

- (void)headerViewControllerDepositButtonClicked:(LGTHeaderViewController *)viewController
{
	[self presentInformationAlertWithTitle:@"deposit" message:@"Пополнить"];
}

- (void)headerViewControllerWithdrawButtonClicked:(LGTHeaderViewController *)viewController
{
	[self presentInformationAlertWithTitle:@"withdraw" message:@"Вывести"];
}

#pragma mark - LGTAccountManagementViewControllerDelegate

- (void)accountManagementViewControllerBillButtonClicked:(LGTAccountManagementViewController *)viewController
{
	[self presentInformationAlertWithTitle:@"bill" message:@"Счет"];
}

- (void)accountManagementViewControllerPayButtonClicked:(LGTAccountManagementViewController *)viewController
{
	[self presentInformationAlertWithTitle:@"pay" message:@"Оплатить"];
}

- (void)accountManagementViewControllerTransferMoneyButtonClicked:(LGTAccountManagementViewController *)viewController
{
	[self presentInformationAlertWithTitle:@"transfer" message:@"Перевести"];
}

#pragma mark - LGTSearchViewControllerDelegate

- (void)searchViewController:(LGTSearchViewController *)viewController wantsPerformSearchWithText:(NSString *)text
{
	[self presentInformationAlertWithTitle:@"Search for:" message:text];
}

- (void)presentInformationAlertWithTitle:(NSString *)title message:(NSString *)message
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *close = [UIAlertAction actionWithTitle:@"Got It" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
	{
		[alert dismissViewControllerAnimated:YES completion:nil];
	}];
	[alert addAction:close];
	[self presentViewController:alert animated:YES completion:nil];
}

@end
