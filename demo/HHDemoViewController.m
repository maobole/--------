//
//  HHDemoViewController.m
//  demo
//
//  Created by Eric on 12-3-9.
//  Copyright (c) 2012年 Tian Tian Tai Mei Net Tech (Bei Jing) Lt.d. All rights reserved.
//

#import "HHDemoViewController.h"
#import "HHTurntableView.h"
#import "WiAdView.h"
@implementation HHDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main.png"]];
    
    WiAdView* adView = [WiAdView adViewWithResId:@"4844096a1364e610" style:kWiAdViewStyleBanner320_50];
    adView.center = CGPointMake(160.0,20);
    adView.delegate = self;
    adView.refreshInterval = 31;
    adView.adBgColor = [UIColor colorWithRed:1.0f green:(CGFloat)0x66/255 blue:(CGFloat)0x33/255 alpha:1.0f];
    [self.view addSubview:adView];
    [adView requestAd];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"request-close.png"]];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(310,adView.center.y);
    
    
    HHTurntableView *turntableView = [[HHTurntableView alloc]initWithFrame:CGRectMake(0.0,0.0,300,300)];
    turntableView.center = self.view.center;
    [self.view addSubview:turntableView];
    
    UIImageView *imagePoint = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_point.png"]];
    imagePoint.center = CGPointMake(self.view.center.x, self.view.center.y -70);
    [self.view addSubview:imagePoint];
    [imagePoint release];
    
    UIImageView *imageTop = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_center.png"]];
    imageTop.center = self.view.center;
    [self.view addSubview:imageTop];
    [imageTop release];
    
    [turntableView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
