//
//  MAPageViewController.m
//  MAPageViewController
//
//  Created by Mike on 7/24/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "VTPageViewController.h"

static const CGFloat kMAPageControlHeight = 140;

@interface VTPageViewController ()

@end

@implementation VTPageViewController

- (instancetype)initWithCustom:(NSArray *)viewControllers pageDotImages:(NSArray *)pageDotImages {
    self = [super init];
    
    _viewControllers = viewControllers;
    _pageDotImages = pageDotImages;
    
    return self;
}


#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupPageViewController];
}

- (void)setupPageViewController {
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    _pageViewController.view.frame = self.view.frame;
    [_pageViewController setViewControllers:@[_viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    
    _pageControl = [[VTUIPageControl alloc]
        initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds) - kMAPageControlHeight, self.view.bounds.size.width, kMAPageControlHeight)
        dotImages:[NSArray arrayWithObjects:
                   [UIImage imageNamed:@"page_sj"],
                   [UIImage imageNamed:@"page_nz"],
                   [UIImage imageNamed:@"page_djr"],
                   [UIImage imageNamed:@"page_sm"],
                   nil]
        dotW:25.0f
        dotM:10.0f
    ];
    _pageControl.delegate = self;
    _pageControl.numberOfPages = _viewControllers.count;
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_pageControl];
}

- (void)clickDotImage:(int)index {
//    NSLog(@"%d", index);
    [_pageViewController setViewControllers:@[_viewControllers[index]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    _pageControl.currentPage = index;
}


- (NSInteger)indexOfViewController:(UIViewController *)viewController {
    NSInteger theIndex = 0;
    for (NSInteger index = 0; index < _viewControllers.count; index++) {
        if (_viewControllers[index] == viewController) {
            theIndex = index;
        }
    }
    return theIndex;
}


#pragma mark - Page view controller delegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (!completed) {
        return;
    }
    
    UIViewController *newViewController = pageViewController.viewControllers[0];
    _pageControl.currentPage = [self indexOfViewController:newViewController];
}


#pragma mark - Page view controller data source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger indexOfCurrentViewController = [self indexOfViewController:viewController];
    return indexOfCurrentViewController > 0 ? _viewControllers[indexOfCurrentViewController - 1] : nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger indexOfCurrentViewController = [self indexOfViewController:viewController];
    return indexOfCurrentViewController < _viewControllers.count - 1 ? _viewControllers[indexOfCurrentViewController + 1] : nil;
}

@end
