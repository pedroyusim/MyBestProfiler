//
//  Q2WorkScheduleViewController.m
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "Q2WorkScheduleViewController.h"
#import "Q4MusicGenreViewController.h"
#import "Util.h"

@interface Q2WorkScheduleViewController ()

@end

@implementation Q2WorkScheduleViewController {
    NSArray *arrayOptionIconImageName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrayOptionIconImageName = @[@"icon_work_schedule_full_time", @"icon_work_schedule_part_time", @"icon_work_schedule_on_call", @"icon_work_schedule_occasional"];
    
    [self setUpRightNavigationBarButton];
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

#pragma mark - Action Methods

- (IBAction)clickedOptionButton:(UIButton *)sender {
    //Set imageView with icon corresponding to the selected option.
    [self.imageViewCurrentSelectedOption setImage:[UIImage imageNamed:[arrayOptionIconImageName objectAtIndex:sender.tag]]];
    
    [self selectButton:sender];
}

- (void)goToNextQuestion {
    if([self selectedButton] == nil) {
        //It means the user hasn't chosen any options yet. Show an alertView.
        UIAlertController *errorController = [UIAlertController alertControllerWithTitle:@"Ops!" message:@"You must choose one option below." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [errorController addAction:okButton];
        
        [self.navigationController presentViewController:errorController animated:YES completion:nil];        
    } else {
        //User can go to next question
        Q4MusicGenreViewController *musicController = [self.storyboard instantiateViewControllerWithIdentifier:@"musicGenreController"];
        
        [self.navigationController pushViewController:musicController animated:YES];
    }
}

#pragma mark - ButtonCollection Methods

- (UIButton *)selectedButton {
    for(UIButton *btn in self.optionButtons) {
        if(btn.selected) {
            return btn;
        }
    }
    return nil;
}

- (void)selectButton:(UIButton *)selectedButton {
    for(UIButton *btn in self.optionButtons) {
        if(selectedButton != btn) {
            btn.selected = NO;
        } else {
            btn.selected = YES;
        }
    }
}

#pragma mark - Helper Methods

- (void)setUpRightNavigationBarButton {
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(goToNextQuestion)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
}
@end
