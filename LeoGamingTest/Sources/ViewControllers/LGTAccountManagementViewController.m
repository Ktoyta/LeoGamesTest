//
//  LGTAccountManagementViewController.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTAccountManagementViewController.h"

@implementation LGTAccountManagementViewController

- (IBAction)transferMoney:(id)sender
{
	[self.delegate accountManagementViewControllerTransferMoneyButtonClicked:self];
}

- (IBAction)pay:(id)sender
{
	[self.delegate accountManagementViewControllerPayButtonClicked:self];
}

- (IBAction)bill:(id)sender
{
	[self.delegate accountManagementViewControllerBillButtonClicked:self];
}

@end
