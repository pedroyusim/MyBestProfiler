//
//  Q2WorkScheduleViewController.h
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Q2WorkScheduleViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *optionButtons;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewCurrentSelectedOption;

- (IBAction)clickedOptionButton:(UIButton *)sender;

@end
