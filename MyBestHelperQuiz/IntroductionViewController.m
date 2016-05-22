//
//  ViewController.m
//  MyBestHelperQuiz
//
//  Created by Lorna Kemp on 21/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "IntroductionViewController.h"
#import "AvatarCollectionViewCell.h"

@interface IntroductionViewController ()

@end

@implementation IntroductionViewController {
    NSArray *arrayLabels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayLabels = @[@"Mario_w100", @"Luigi_w100", @"Peach_w100", @"Yoshi_w100", @"Bowser_w100"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AvatarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"avatarCell" forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:[arrayLabels objectAtIndex:indexPath.item]];
    
    [cell.imageVIew setImage:image];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

@end
