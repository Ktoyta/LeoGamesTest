//
//  LGTTableViewCell.m
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import "LGTTableViewCell.h"
#import "LGTAccountItem.h"

@interface LGTTableViewCell()

@property (nonatomic, weak, readwrite) IBOutlet UIStackView *separatorSteckView;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *sectionName;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, weak, readwrite) IBOutlet UIImageView *iconView;
@property (nonatomic, weak, readwrite) IBOutlet UIButton *starButton;

@end

@implementation LGTTableViewCell

- (IBAction)starClick:(id)sender
{
	self.representedObject.chosen = !self.representedObject.chosen;
	[self selectStar];
}

- (void)setSection:(NSString *)section
{
	if (self.sectionName.text != section)
	{
		self.sectionName.text = section;
		self.sectionName.hidden = section == nil;
	}
}

- (void)setHideSeparator:(BOOL)hideSeparator
{
	if (_hideSeparator != hideSeparator)
	{
		_hideSeparator = hideSeparator;
		self.separatorSteckView.hidden = hideSeparator;
	}
}

- (void)selectStar
{
	NSString *imageName = @"EmptyStar";
	if (self.representedObject.chosen)
	{
		imageName = @"FilledStar";
	}
	[self.starButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (NSString *)section
{
	return self.sectionName.text;
}

- (void)setRepresentedObject:(id<LGTAccountRepresentation>)representedObject
{
	if (_representedObject != representedObject)
	{
		_representedObject = representedObject;
		self.titleLabel.text = _representedObject.title;
		self.subtitleLabel.text = _representedObject.subtitle;
		self.subtitleLabel.hidden = _representedObject.subtitle == nil;
		self.iconView.image = _representedObject.icon;
		[self selectStar];
	}
}

@end
