//
//  Q9ActivityViewController.m
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "Q9ActivityViewController.h"
#import "ResultsViewController.h"

@interface Q9ActivityViewController ()

@end

@implementation Q9ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)clickedActivityButton:(id)sender {
    ResultsViewController *resultsController = [self.storyboard instantiateViewControllerWithIdentifier:@"resultsController"];
    
    [self.navigationController pushViewController:resultsController animated:YES];
}

@end
