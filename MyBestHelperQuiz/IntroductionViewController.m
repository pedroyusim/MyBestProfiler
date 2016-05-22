//
//  ViewController.m
//  MyBestHelperQuiz
//
//  Created by Lorna Kemp on 21/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "IntroductionViewController.h"
#import "AvatarCollectionViewCell.h"
#import "CreditsViewController.h"
#import "Q2WorkScheduleViewController.h"
#import "Util.h"

@interface IntroductionViewController ()

@end

@implementation IntroductionViewController {
    NSArray *arrayLabels;
    NSArray *arrayAvatarSubtitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayLabels = @[@"child_care_image", @"elder_care_image", @"pet_care_image", @"home_care_image"];
    arrayAvatarSubtitles = @[@"Child care", @"Elder care", @"Pet care", @"Home care"];
    
//    [Util setNavigationItemImageForViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [arrayLabels count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AvatarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"avatarCell" forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:[arrayLabels objectAtIndex:indexPath.item]];
    
    [cell.imageVIew setImage:image];
    
    cell.labelDescription.text = [arrayAvatarSubtitles objectAtIndex:indexPath.item];
    
    cell.buttonChooseCharacter.tag = indexPath.item;
    [cell.buttonChooseCharacter addTarget:self action:@selector(clickedChooseCharacterButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    return CGSizeMake(screenRect.size.width, 360.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

#pragma mark - ScrollView Methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //Adjusting labelItemIndicator once ScrollView stops scrolling;
    CGRect visibleRect = (CGRect){.origin = self.collectionView.contentOffset, .size = self.collectionView.bounds.size};
    CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
    NSIndexPath *visibleIndexPath = [self.collectionView indexPathForItemAtPoint:visiblePoint];
    
    self.labelItemIndicator.text = [NSString stringWithFormat:@"%d of 4", visibleIndexPath.item+1];
}

#pragma mark - Action Methods

//Action method for both previous and next item selection;
- (IBAction)clickedChangeAvatarButton:(id)sender {
    //Finding out indexPath for currentSelection;
    CGRect visibleRect = (CGRect){.origin = self.collectionView.contentOffset, .size = self.collectionView.bounds.size};
    CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
    NSIndexPath *visibleIndexPath = [self.collectionView indexPathForItemAtPoint:visiblePoint];
    
    int newSelectionIndex = visibleIndexPath.item;
    
    switch (((UIButton *)sender).tag) {
        case 1:
            newSelectionIndex = newSelectionIndex - 1;
            break;
        case 2:
            newSelectionIndex = newSelectionIndex + 1;
            break;
        default:
            break;
    }
    
    if(newSelectionIndex < 0 || newSelectionIndex >= [arrayLabels count]) {
        return;
    }
    
    self.labelItemIndicator.text = [NSString stringWithFormat:@"%d of 4", newSelectionIndex+1];
    
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:newSelectionIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    
}

- (IBAction)clickedNextButton:(id)sender {
    CreditsViewController *creditsController = [self.storyboard instantiateViewControllerWithIdentifier:@"creditsController"];
    
    [self.navigationController pushViewController:creditsController animated:YES];
}

- (void)clickedChooseCharacterButton:(UIButton *)btn {
    Q2WorkScheduleViewController *workScheduleController = [self.storyboard instantiateViewControllerWithIdentifier:@"workScheduleController"];
    
    [self.navigationController pushViewController:workScheduleController animated:YES];
}

@end
