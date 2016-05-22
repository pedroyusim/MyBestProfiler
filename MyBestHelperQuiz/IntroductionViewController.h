//
//  ViewController.h
//  MyBestHelperQuiz
//
//  Created by Lorna Kemp on 21/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroductionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UILabel *labelItemIndicator;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)clickedChangeAvatarButton:(id)sender;
- (IBAction)clickedNextButton:(id)sender;

@end

