//
//  LGTSearchViewController.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTSearchViewController.h"

@implementation LGTSearchViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self.delegate searchViewController:self wantsPerformSearchWithText:textField.text];
	[textField resignFirstResponder];
	return YES;
}

@end
