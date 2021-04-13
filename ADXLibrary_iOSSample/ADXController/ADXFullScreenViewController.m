//
//  ADXFullScreenViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 23..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXFullScreenViewController.h"
#import <MoPub.h>

@interface ADXFullScreenViewController () <MPInterstitialAdControllerDelegate>
@property (nonatomic, retain) MPInterstitialAdController *interstitial;
@end

@implementation ADXFullScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInterstitial];
}

- (void)loadInterstitial {
    
    self.interstitial = [MPInterstitialAdController
                         interstitialAdControllerForAdUnitId:INTERSTITIAL_AD_UNIT_ID];
    self.interstitial.delegate = self;
}

- (IBAction)selectShowAd:(id)sender {
     [self.interstitial loadAd];
}


#pragma mark - MPInterstitialAdControllerDelegate

- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    [self.interstitial showFromViewController:self];
}
- (void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial withError:(NSError *)error {

}
- (void)interstitialWillAppear:(MPInterstitialAdController *)interstitial {

}
- (void)interstitialDidAppear:(MPInterstitialAdController *)interstitial {

}
- (void)interstitialWillDismiss:(MPInterstitialAdController *)interstitial {

}
- (void)interstitialDidDismiss:(MPInterstitialAdController *)interstitial {

}

- (void)interstitialDidExpire:(MPInterstitialAdController *)interstitial {
    
}

- (void)interstitialDidReceiveTapEvent:(MPInterstitialAdController *)interstitial {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
