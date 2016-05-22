//
//  AvatarCollectionViewCell.h
//  MyBestHelperQuiz
//
//  Created by Lorna Kemp on 21/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvatarCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageVIew;

@property (strong, nonatomic) IBOutlet UILabel *labelDescription;

@property (strong, nonatomic) IBOutlet UIButton *buttonChooseCharacter;

@end
