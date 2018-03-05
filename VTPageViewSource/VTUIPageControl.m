//
//  MOUIPageControl.m
//  DigitClock
//
//  Created by  valiant on 2018/3/1.
//  Copyright © 2018年 minvia1990. All rights reserved.
//

#import "VTUIPageControl.h"

@interface VTUIPageControl () {
    NSArray *dotImages;
    CGFloat dotWidth;
    CGFloat dotMargin;
}

@end

@implementation VTUIPageControl

- (id)initWithFrame:(CGRect)frame dotImages:(NSArray *)images dotW:(CGFloat)width dotM:(CGFloat)margin {
    self = [super initWithFrame:frame];
    if (self) {
        dotImages = images;
        dotWidth = width;
        dotMargin = margin;
        
        self.pageIndicatorTintColor = [UIColor clearColor];
        self.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = dotWidth + dotMargin;
    
    //计算整个pageControll的宽度
    CGFloat newW = self.subviews.count * marginX - dotMargin;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);

    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIView* dot = [self.subviews objectAtIndex:i];
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotWidth, dotWidth)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotWidth, dotWidth)];
        }
        
        UIImageView* dotImageView = [self imageViewForSubview: dot];
        dotImageView.image = [dotImages objectAtIndex:i];
        dotImageView.tag = i;
        dotImageView.userInteractionEnabled = YES;
        dotImageView.image = [dotImages objectAtIndex:i];
        
        //添加手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(whenClickImage:)];
        [dotImageView addGestureRecognizer:singleTap];
    }
}

-(void)whenClickImage:(id)sender {
    UITapGestureRecognizer* singleTap = (UITapGestureRecognizer*)sender;
    int index = (int)[singleTap view].tag;
    [self.delegate clickDotImage:index];
}

//覆盖dot,达到改变图片的目的
- (UIImageView *)imageViewForSubview:(UIView *) view {
    UIImageView * dot = nil;
    if ([view isKindOfClass: [UIView class]]) {
        for (UIView* subview in view.subviews) {
            if ([subview isKindOfClass:[UIImageView class]]) {
                dot = (UIImageView *)subview;
                break;
            }
        }
        if (dot == nil) {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            [view addSubview:dot];
        }
    }else {
        dot = (UIImageView *) view;
    }
    
    return dot;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
