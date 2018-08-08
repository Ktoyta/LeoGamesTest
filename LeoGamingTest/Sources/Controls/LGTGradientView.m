//
//  LGTGradientView.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 07.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTGradientView.h"


@interface LGTGradientView()

@property (nonatomic, strong, readwrite) CAGradientLayer *gradientLayer;

@end

@implementation LGTGradientView

- (CAGradientLayer *)gradientLayer
{
	if (_gradientLayer == nil)
	{
		CAGradientLayer *gradientLayer = [CAGradientLayer layer];
		gradientLayer.frame = self.layer.bounds;
		gradientLayer.startPoint = CGPointMake(0.5, 0.0);
		gradientLayer.endPoint = CGPointMake(1.0, 0.5);
		gradientLayer.colors = @[(id)[UIColor colorNamed:@"HeaderGradientStartColor"].CGColor, (id)[UIColor colorNamed:@"HeaderGradientEndColor"].CGColor];
		
		[self.layer insertSublayer:gradientLayer atIndex:0];
		
		_gradientLayer = gradientLayer;
	}
	
	return _gradientLayer;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
	[super layoutSublayersOfLayer:layer];
	self.gradientLayer.frame = self.layer.bounds;
}

@end
