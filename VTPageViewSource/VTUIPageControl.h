//
//  MOUIPageControl.h
//  DigitClock
//
//  Created by  valiant on 2018/3/1.
//  Copyright © 2018年 minvia1990. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VTUIPageControlDelegate <NSObject>

- (void)clickDotImage:(int)index;

@end

@interface VTUIPageControl : UIPageControl

@property (weak, nonatomic) id<VTUIPageControlDelegate> delegate;

- (id)initWithFrame:(CGRect)frame dotImages:(NSArray *)images dotW:(CGFloat)width dotM:(CGFloat)margin;

@end
