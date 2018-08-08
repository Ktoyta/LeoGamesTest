//
//  LGTAccountItem.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTAccountItem.h"

@implementation LGTAccountItem
@synthesize chosen;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize icon = _icon;

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle icon:(UIImage *)icon
{
	self = [super init];
	if (self != nil)
	{
		_title = [title copy];
		_subtitle = [subtitle copy];
		_icon = icon;
	}
	return self;
}

@end
