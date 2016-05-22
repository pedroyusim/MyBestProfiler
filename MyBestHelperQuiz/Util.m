//
//  Util.m
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "Util.h"

@implementation Util

/**

 Helper method to create imageView for each controller navigationItem;
 
 */

+ (void)setNavigationItemImageForViewController:(UIViewController *)viewController {
    UIImage *myBestProfilerLogo = [UIImage imageNamed:@"logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 183, 35)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView setImage:myBestProfilerLogo];
    
    [viewController.navigationController.navigationBar addSubview:imageView];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:imageView.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:imageView.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    NSDictionary *dict = @{@"imageView":imageView};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[imageView(157)]" options:0.0 metrics:nil views:dict];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(30)]" options:0.0 metrics:nil views:dict];
    
    [viewController.navigationController.navigationBar addConstraint:centerX];
    [viewController.navigationController.navigationBar addConstraint:centerY];
    [viewController.navigationController.navigationBar addConstraints:horizontalConstraints];
    [viewController.navigationController.navigationBar addConstraints:verticalConstraints];
}

@end
