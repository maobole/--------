//
//  HHTurntableView.m
//  demo
//
//  Created by Eric on 12-3-9.
//  Copyright (c) 2012年 Tian Tian Tai Mei Net Tech (Bei Jing) Lt.d. All rights reserved.
//

#import "HHTurntableView.h"
#import <QuartzCore/QuartzCore.h>
#import "HHPlayAudio.h"
#import "WiAdView.h"
#define kTurntableNum 12
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)
@implementation HHTurntableView


- (void)initView
{
    self.backgroundColor = [UIColor clearColor];
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat angle = DEGREES_TO_RADIANS((360.0/kTurntableNum));
    currentTag = 0;
    for (int i = 0; i < kTurntableNum; i++) 
    {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.tag = i;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bt_%d.png",i + 1]];
        [button1 setFrame:CGRectMake((viewW - image.size.width)/2.0,0.0 + image.size.height/2.0 ,image.size.width, image.size.height)];
        button1.layer.anchorPoint = CGPointMake(0.5,1.0);
        button1.layer.transform= CATransform3DMakeRotation(angle * i *1.0,0.0, 0.0, 1.0);
        
        
        [button1 setImage:image forState:UIControlStateNormal];
        image = [UIImage imageNamed:[NSString stringWithFormat:@"bt_selected_%d.png",i + 1]];
        [button1 setImage:image forState:UIControlEventTouchUpInside];
        [button1 addTarget:self action:@selector(buttonDown:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
    }
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (CGFloat)getAngle:(NSInteger)current endTag:(NSInteger)end
{
    int tmp = kTurntableNum/2;
    if (end > tmp)
    {
        return  DEGREES_TO_RADIANS((kTurntableNum - end) * (360.0/kTurntableNum));
    }
    else 
    {
        return DEGREES_TO_RADIANS(-end * (360.0/kTurntableNum));
    }
}

- (void)buttonDown:(id)sender
{
    kIsAdShow;
    UIButton *button = (UIButton *)sender;
    if (button.tag == currentTag)
    {
        return;
    }
    
    if (!animationIng)
    {
        animationIng = YES;
        
        [HHPlayAudio playAudio:@"Tink.wav"];//播放声音
        [UIView beginAnimations:@"present-countdown" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationStop)];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
       // self.layer.transform = CATransform3DRotate(self.layer.transform,[self getAngle:currentTag endTag:button.tag],0.0, 0.0, 1.0);
        self.layer.transform = CATransform3DMakeRotation([self getAngle:currentTag endTag:button.tag],0.0, 0.0, 1.0);
        currentTag = button.tag;
        [UIView commitAnimations];
    }
    
}
- (void)animationStop
{
    animationIng = NO;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context,1.0,-1.0);
    CGContextTranslateCTM(context, 0,-self.bounds.size.height); 
    UIImage *img = [UIImage imageNamed:@"bg_circle.png"];
	CGContextDrawImage(context,self.bounds,img.CGImage);
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewH = self.bounds.size.height;
    
    img = [UIImage imageNamed:@"bg_point.png"];
    CGFloat w = img.size.width;
    CGFloat h = img.size.height;
    CGRect Rect =  CGRectMake((viewW - w)/2.0,(viewH -h)/2.0 + 60,w,h);
	CGContextDrawImage(context,Rect,img.CGImage);
    
    
    img = [UIImage imageNamed:@"bg_center.png"];
    w = img.size.width;
    h = img.size.height;
    Rect =  CGRectMake((viewW - w)/2.0,(viewH -h)/2.0,w,h);
	CGContextDrawImage(context,Rect,img.CGImage);

    CGContextRestoreGState(context);

}


@end
