//
//  PageViewController.h
//  ShakeScroll
//
//  Created by Thomas Lin on 9/23/14.
//  Copyright (c) 2014 Thomas Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *pageTitle;

@property NSUInteger pageIndex;
@property NSString *titleText;

@end
