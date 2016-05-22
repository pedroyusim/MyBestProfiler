//
//  CustomNavigationViewController.m
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *myBestProfilerLogo = [UIImage imageNamed:@"logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 183, 35)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView setImage:myBestProfilerLogo];
    
    [self.navigationBar addSubview:imageView];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageView.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageView.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    NSDictionary *dict = @{@"imageView":imageView};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView(157)]" options:0.0 metrics:nil views:dict];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(30)]" options:0.0 metrics:nil views:dict];
    
    [self.navigationBar addConstraint:centerX];
    [self.navigationBar addConstraint:centerY];
    [self.navigationBar addConstraints:horizontalConstraints];
    [self.navigationBar addConstraints:verticalConstraints];
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
