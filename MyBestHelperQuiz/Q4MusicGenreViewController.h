//
//  Q4MusicGenreViewController.h
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Q4MusicGenreViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionViewSoundtracks;

@property (strong, nonatomic) AVAudioPlayer *currentMusicPlayer;

@property (strong, nonatomic) AVAudioPlayer *musicPlayerPop;
@property (strong, nonatomic) AVAudioPlayer *musicPlayerRock;
@property (strong, nonatomic) AVAudioPlayer *musicPlayerWorldMusic;
@property (strong, nonatomic) AVAudioPlayer *musicPlayerClassical;

- (IBAction)clickedChangeSoundtrack:(id)sender;

@end
