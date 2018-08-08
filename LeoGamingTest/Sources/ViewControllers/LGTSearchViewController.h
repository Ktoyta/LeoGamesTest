//
//  LGTSearchViewController.h
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTSearchViewControllerDelegate;

@interface LGTSearchViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak, readwrite) id<LGTSearchViewControllerDelegate> delegate;

@end

@protocol LGTSearchViewControllerDelegate <NSObject>

- (void)searchViewController:(LGTSearchViewController *)viewController wantsPerformSearchWithText:(NSString *)text;

@end
