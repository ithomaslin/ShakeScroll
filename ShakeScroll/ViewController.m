//
//  ViewController.m
//  ShakeScroll
//
//  Created by Thomas Lin on 9/23/14.
//  Copyright (c) 2014 Thomas Lin. All rights reserved.
//

#import "ViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x042C3AD);
    
    _pageTitle = @[@"Shake to scroll", @"Cool!", @"Awesome!", @"Spectacular!", @"Extraordinary!"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.pageViewController = [storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageViewController *pageView = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[pageView];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    
    // Giving the frame of the page view
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 160);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.type == UIEventSubtypeMotionShake && _currentIndex < [self.pageTitle count]) {
        [self shakeToScroll];
    }
}

- (void)shakeToScroll
{
    PageViewController *pageView = [self viewControllerAtIndex:++_currentIndex];
    if (pageView) {
        NSArray *controllers = @[pageView];
        [self.pageViewController setViewControllers:controllers
                                          direction:UIPageViewControllerNavigationDirectionForward
                                           animated:YES
                                         completion:nil];
    }
}

- (PageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitle count] == 0) || (index >= [self.pageTitle count])) {
        return nil;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PageViewController *pageViewController = (PageViewController *)[storyboard instantiateViewControllerWithIdentifier:@"PageView"];
    pageViewController.titleText = self.pageTitle[index];
    pageViewController.pageIndex = index;
    
    return pageViewController;
}

#pragma - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController *) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    _currentIndex = index;
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageViewController *) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    _currentIndex = index;
    index++;
    
    if (index == [self.pageTitle count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitle count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return self.currentIndex;
}


@end
