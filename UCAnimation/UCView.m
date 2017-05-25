//
//  UCView.m
//  画圆
//
//  Created by 蓝云 on 2017/4/28.
//  Copyright © 2017年 蓝云. All rights reserved.
//

#import "UCView.h"

@interface UCView (){
    CAShapeLayer *layer;
    UIButton *button;
    UIButton *button2;
    UIButton *button3;
}

@end

@implementation UCView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)initView {
    
    UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    backview.backgroundColor = [UIColor clearColor];
    [self addSubview:backview];
    [self bringSubviewToFront:backview];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(20, 60, 50, 50)];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:@"百度" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    [backview addSubview:button];
    
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(150, 60, 50, 50)];
    button2.titleLabel.font = [UIFont systemFontOfSize:17];
    [button2 setTitle:@"新浪" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor clearColor];
    [backview addSubview:button2];
    
    button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setFrame:CGRectMake(305, 60, 50, 50)];
    button3.titleLabel.font = [UIFont systemFontOfSize:17];
    [button3 setTitle:@"淘宝" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    button3.backgroundColor = [UIColor clearColor];
    [backview addSubview:button3];
    
}

- (void)drawRect:(CGRect)rect
{

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 200)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(375, 0)];
    [path addLineToPoint:CGPointMake(375, 200)];
    [path addCurveToPoint:CGPointMake(0, 200) controlPoint1:CGPointMake(375, 200) controlPoint2:CGPointMake(375/2, 200-_progress)];
    
    [path closePath];
    
    if (!layer) {
        layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor colorWithRed:102/255.0 green:150/255.0 blue:237/255.0 alpha:1.0].CGColor;
        
        [self.layer addSublayer:layer];
    }
    layer.path = path.CGPath;
    
    if (!button3) {
        [self initView];
    }
    
}

- (void)layoutSubviews
{
    NSLog(@"setNeedsLayout");
}


- (void)setProgress:(CGFloat)progress
{
    
    _progress = progress;
    
    [self setNeedsDisplay];
    if (_progress>0) {
        [button setFrame:CGRectMake(20+_progress/5, 60, 50, 50)];
        [button3 setFrame:CGRectMake(305-_progress/5, 60, 50, 50)];
        button3.alpha =1-_progress/100;
        button2.alpha =1-_progress/100;
        button.alpha =1-_progress/100;
    }
}

@end
