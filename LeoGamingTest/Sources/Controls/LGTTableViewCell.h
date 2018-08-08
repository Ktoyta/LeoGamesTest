//
//  LGTTableViewCell.h
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTAccountRepresentation;

@protocol LGTTableViewCellDelegate;

@interface LGTTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<LGTAccountRepresentation> representedObject;
@property (nonatomic, copy, readwrite) NSString *section;
@property (nonatomic, assign, readwrite) BOOL hideSeparator;

@end
