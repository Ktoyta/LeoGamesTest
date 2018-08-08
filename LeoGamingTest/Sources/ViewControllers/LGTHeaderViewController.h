//
//  LGTHeaderViewController.h
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 07.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTHeaderViewControllerDelegate;

@interface LGTHeaderViewController : UIViewController

@property (nonatomic, weak, readwrite) id<LGTHeaderViewControllerDelegate> delegate;

@end

@protocol LGTHeaderViewControllerDelegate <NSObject>

- (void)headerViewControllerDepositButtonClicked:(LGTHeaderViewController *)viewController;
- (void)headerViewControllerWithdrawButtonClicked:(LGTHeaderViewController *)viewController;

@end
