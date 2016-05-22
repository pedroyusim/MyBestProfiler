//
//  Q4MusicGenreViewController.m
//  MyBestProfiler
//
//  Created by Lorna Kemp on 22/05/16.
//  Copyright © 2016 Pedro Yusim. All rights reserved.
//

#import "Q4MusicGenreViewController.h"
#import "SoundtrackCollectionViewCell.h"
#import "Q9ActivityViewController.h"

@interface Q4MusicGenreViewController ()

@end

@implementation Q4MusicGenreViewController {
    NSArray *arraySoundtrackCovers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arraySoundtrackCovers = @[@"music_genre_pop", @"music_genre_classical", @"music_genre_world_music", @"music_genre_rock"];
    
    [self setUpRightNavigationBarButton];
    
    [self instantiateAllMusicPlayers];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.currentMusicPlayer play];
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

#pragma mark - CollectionView Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SoundtrackCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"soundtrackCell" forIndexPath:indexPath];
    
    [cell.imageViewSoundtrackCover setImage:[UIImage imageNamed:[arraySoundtrackCovers objectAtIndex:indexPath.item]]];
    
    return cell;
}

#pragma mark - Action Methods

- (IBAction)clickedChangeSoundtrack:(id)sender {
    //Finding out indexPath for currentSelection;
    CGRect visibleRect = (CGRect){.origin = self.collectionViewSoundtracks.contentOffset, .size = self.collectionViewSoundtracks.bounds.size};
    CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
    NSIndexPath *visibleIndexPath = [self.collectionViewSoundtracks indexPathForItemAtPoint:visiblePoint];
    
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
    
    if(newSelectionIndex < 0 || newSelectionIndex >= [arraySoundtrackCovers count]) {
        return;
    }
    
    //Stopping currentMusicPlayer and assigning new one to variable.
    [self.currentMusicPlayer stop];
    switch (newSelectionIndex) {
        case 0:
            self.currentMusicPlayer = self.musicPlayerPop;
            break;
        case 1:
            self.currentMusicPlayer = self.musicPlayerClassical;
            break;
        case 2:
            self.currentMusicPlayer = self.musicPlayerWorldMusic;
            break;
        case 3:
            self.currentMusicPlayer = self.musicPlayerRock;
            break;
        default:
            break;
    }
    [self.currentMusicPlayer play];
    
    [self.collectionViewSoundtracks selectItemAtIndexPath:[NSIndexPath indexPathForItem:newSelectionIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

- (void)goToNextQuestion {
    Q9ActivityViewController *activityController = [self.storyboard instantiateViewControllerWithIdentifier:@"activityController"];
    
    [self.currentMusicPlayer stop];
    
    [self.navigationController pushViewController:activityController animated:YES];
}

#pragma mark - Helper Methods

- (void)setUpRightNavigationBarButton {
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(goToNextQuestion)];
    self.navigationItem.rightBarButtonItem = anotherButton;
}

- (void)instantiateAllMusicPlayers {
    //Getting URL for music files.
    NSString *genrePop = [[NSBundle mainBundle] pathForResource:@"genre_pop" ofType:@"mp3"];
    NSURL *genrePopURL = [NSURL fileURLWithPath:genrePop];
    
    NSString *genreClassical = [[NSBundle mainBundle] pathForResource:@"genre_classical" ofType:@"mp3"];
    NSURL *genreClassicalURL = [NSURL fileURLWithPath:genreClassical];
    
    NSString *genreRock = [[NSBundle mainBundle] pathForResource:@"genre_rock" ofType:@"mp3"];
    NSURL *genreRockURL = [NSURL fileURLWithPath:genreRock];
    
    NSString *genreWorldMusic = [[NSBundle mainBundle] pathForResource:@"genre_world_music" ofType:@"mp3"];
    NSURL *genreWorldMusicURL = [NSURL fileURLWithPath:genreWorldMusic];
    
    //Preparing AVAudioPlayers.
    NSError *errorPop;
    self.musicPlayerPop = [[AVAudioPlayer alloc]
                                  initWithContentsOfURL:genrePopURL error:&errorPop];
    [self.musicPlayerPop prepareToPlay];
    
    NSError *errorClassical;
    self.musicPlayerClassical = [[AVAudioPlayer alloc]
                           initWithContentsOfURL:genreClassicalURL error:&errorClassical];
    [self.musicPlayerClassical prepareToPlay];
    
    NSError *errorRock;
    self.musicPlayerRock = [[AVAudioPlayer alloc]
                           initWithContentsOfURL:genreRockURL error:&errorRock];
    [self.musicPlayerRock prepareToPlay];
    
    NSError *errorWorldMusic;
    self.musicPlayerWorldMusic = [[AVAudioPlayer alloc]
                           initWithContentsOfURL:genreWorldMusicURL error:&errorWorldMusic];
    [self.musicPlayerWorldMusic prepareToPlay];
//    [self.backgroundMusicPlayer play];
    
    //Setting currentMusicPlayer to Pop since it is the first shown albumn.
    self.currentMusicPlayer = self.musicPlayerPop;
    
}

@end
