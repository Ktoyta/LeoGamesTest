//
//  LGTRoundedButton.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 07.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTRoundedButton.h"

@implementation LGTRoundedButton

- (void)didMoveToWindow
{
	[super didMoveToWindow];
	self.layer.cornerRadius = self.frame.size.height / 2.0;
}

@end
