//
//  LGTAccountItem.h
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTAccountRepresentation <NSObject>

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subtitle;
@property (nonatomic, strong, readonly) UIImage *icon;
@property (nonatomic, assign, readwrite) BOOL chosen;

@end

@interface LGTAccountItem : NSObject <LGTAccountRepresentation>

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle icon:(UIImage *)icon;

@end
