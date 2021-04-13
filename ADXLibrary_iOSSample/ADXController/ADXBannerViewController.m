//
//  ADXBannerViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 23..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXBannerViewController.h"
#import "MPAdView.h"

@interface ADXBannerViewController () <MPAdViewDelegate>
@property (nonatomic) MPAdView *adView;
@end

@implementation ADXBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adView = [[MPAdView alloc] initWithAdUnitId:BANNER_AD_UNIT_ID];
    self.adView.delegate = self;
    
    CGSize bannerSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, kMPPresetMaxAdSize50Height.height);
    self.adView.frame = CGRectMake((UIScreen.mainScreen.bounds.size.width - bannerSize.width) / 2,
                                   UIScreen.mainScreen.bounds.size.height - bannerSize.height,
                                   bannerSize.width, bannerSize.height);
    [self.view addSubview:self.adView];
    [self.adView loadAd];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    CGSize bannerSise = [self.adView adContentViewSize];
    CGFloat centeredX = (size.width - bannerSise.width) / 2;
    CGFloat bottomAlignedY = size.height - bannerSise.height;
    self.adView.frame = CGRectMake(centeredX, bottomAlignedY, bannerSise.width, bannerSise.height);
}

#pragma mark - <MPAdViewDelegate>
- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)adViewDidLoadAd:(MPAdView *)view adSize:(CGSize)adSize {
    NSLog(@"adViewDidLoadAd");
}

- (void)adView:(MPAdView *)view didFailToLoadAdWithError:(NSError *)error {
    NSLog(@"adViewDidFail");
}

@end
