//
//  LGTAccountManagementViewController.h
//  LeoGamingTest
//
//  Created by Konstantin Boichenko on 08.08.2018.
//  Copyright © 2018 Konstantin Boichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGTAccountManagementViewControllerDelegate;

@interface LGTAccountManagementViewController : UIViewController

@property (nonatomic, weak, readwrite) id<LGTAccountManagementViewControllerDelegate> delegate;

@end

@protocol LGTAccountManagementViewControllerDelegate <NSObject>

- (void)accountManagementViewControllerTransferMoneyButtonClicked:(LGTAccountManagementViewController *)viewController;
- (void)accountManagementViewControllerPayButtonClicked:(LGTAccountManagementViewController *)viewController;
- (void)accountManagementViewControllerBillButtonClicked:(LGTAccountManagementViewController *)viewController;

@end
