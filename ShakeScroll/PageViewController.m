//
//  PageViewController.m
//  ShakeScroll
//
//  Created by Thomas Lin on 9/23/14.
//  Copyright (c) 2014 Thomas Lin. All rights reserved.
//

#import "PageViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x042C3AD);
    self.pageTitle.text = self.titleText;
    self.pageTitle.textColor = [UIColor whiteColor];
    self.pageTitle.frame = CGRectMake(self.view.frame.size.width / 2,
                                      self.view.frame.size.height / 2,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
