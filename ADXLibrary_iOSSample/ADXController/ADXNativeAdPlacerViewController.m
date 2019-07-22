//
//  ADXNativeAdPlacerViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 24..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXNativeAdPlacerViewController.h"
#import <MPCollectionViewAdPlacer.h>
#import "NativeAdView.h"
#import <ADXLibrary/NativeAdFactory.h>
#import <MPNativeAd.h>

@interface ADXNativeAdPlacerViewController () <UICollectionViewDataSource, UICollectionViewDelegate, MPCollectionViewAdPlacerDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (nonatomic, strong) MPCollectionViewAdPlacer *placer;

@end

@implementation ADXNativeAdPlacerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NativeAdFactory sharedInstance] setRenderingViewClass:NATIVE_AD_UNIT_ID renderingViewClass:[NativeAdView class]];
    
    self.placer = [[NativeAdFactory sharedInstance] getCollectionViewAdPlacer:NATIVE_AD_UNIT_ID
                                                               collectionView:self.mainCollectionView
                                                               viewController:self
                                                              viewSizeHandler:^CGSize(CGFloat maximumWidth) {
                                                                  CGFloat width = [UIScreen mainScreen].bounds.size.width;
                                                                  return CGSizeMake(width, 270.0);
                                                              }];
    [self.placer loadAdsForAdUnitID:NATIVE_AD_UNIT_ID];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row : %ld", (long)indexPath.row);
    
    return FALSE;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
