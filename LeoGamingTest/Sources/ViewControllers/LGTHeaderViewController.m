//
//  LGTHeaderViewController.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 07.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTHeaderViewController.h"

@implementation LGTHeaderViewController

- (IBAction)deposit:(id)sender
{
	[self.delegate headerViewControllerDepositButtonClicked:self];
}

- (IBAction)withdraw:(id)sender
{
	[self.delegate headerViewControllerWithdrawButtonClicked:self];
}

@end
