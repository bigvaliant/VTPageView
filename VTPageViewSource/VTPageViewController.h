//
//  MAPageViewController.h
//  MAPageViewController
//
//  Created by Mike on 7/24/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTUIPageControl.h"

@interface VTPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, VTUIPageControlDelegate> {
    NSArray *_viewControllers;
    UIPageViewController *_pageViewController;
    VTUIPageControl *_pageControl;
    CGFloat _cntrYMargin;
    NSArray *_pageDotImages;
    CGFloat _dotWidth;
    CGFloat _dotMargin;
}

- (instancetype)initWithCustom:(NSArray *)viewControllers
                pageCntrYMargin:(CGFloat)cntrYMargin
                pageDotImages:(NSArray *)pageDotImages
                pageDotWidth:(CGFloat)dotWidth
                pageDotMargin:(CGFloat)dotMargin;
@end
