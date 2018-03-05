# VTPageView
Building a Custom UIPageViewController

Code Example:

        ViewController *v1 = [ViewController new];
        v1.view.backgroundColor = [UIColor redColor];
        ViewController *v2 = [ViewController new];
        v2.view.backgroundColor = [UIColor blueColor];
        ViewController *v3 = [ViewController new];
        v3.view.backgroundColor = [UIColor purpleColor];
        ViewController *v4 = [ViewController new];
        v4.view.backgroundColor = [UIColor yellowColor];


        NSArray *images = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"page_sj"],
                            [UIImage imageNamed:@"page_nz"],
                            [UIImage imageNamed:@"page_djr"],
                            [UIImage imageNamed:@"page_sm"],
                            nil];
        NSArray *viewControllers = @[v1, v2, v3, v4];
        VTPageViewController* mainVC = [[VTPageViewController alloc]
                            initWithCustom:viewControllers
                            pageDotImages:images
                            pageDotWidth:25.0f
                            pageDotMargin:15.0f
                            ];

Run Screenshots:

![image](https://github.com/bigvaliant/VTPageView/blob/master/image1.png)
![image](https://github.com/bigvaliant/VTPageView/blob/master/image2.png)
