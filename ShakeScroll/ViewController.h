//
//  ViewController.h
//  ShakeScroll
//
//  Created by Thomas Lin on 9/23/14.
//  Copyright (c) 2014 Thomas Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"

@interface ViewController : UIViewController
<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate,
UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitle;

@property NSUInteger currentIndex;

@end

