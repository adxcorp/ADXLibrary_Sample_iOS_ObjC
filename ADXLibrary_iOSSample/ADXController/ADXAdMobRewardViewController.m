//
//  ADXAdMobRewardViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 4. 18..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXAdMobRewardViewController.h"
#import <ADXGDPR.h>
#import <VungleAdNetworkExtras.h>

@import GoogleMobileAds;

@interface ADXAdMobRewardViewController () <GADRewardBasedVideoAdDelegate>

@end

@implementation ADXAdMobRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GADRewardBasedVideoAd sharedInstance].delegate = self;
    [self loadAdAdMob];
    
}

- (void)loadAdAdMob {
    GADRequest *request = [GADRequest request];
    
    //*** GDPR
    if ([ADXGDPR.sharedInstance getConsentState] == ADXConsentStateDenied) {
        GADExtras *extras = [[GADExtras alloc] init];
        extras.additionalParameters = @{@"npa": @"1"};
        [request registerAdNetworkExtras:extras];
    }
    request.testDevices = @[ @"e527e0336ebd9354411d932aa50910ca" ];
    [[GADRewardBasedVideoAd sharedInstance] loadRequest:request
                                           withAdUnitID:@"ca-app-pub-7466439784264697/6572954274"];
}

- (IBAction)selectShowAd:(id)sender {
    
    if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
        NSLog(@"isReady");
        [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:self];
    } else {
        NSLog(@"isNOTReady");
        [self loadAdAdMob];
    }
}

#pragma mark - GADRewardBasedVideoAdDelegate

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd didRewardUserWithReward:(GADAdReward *)reward {
    NSString *rewardMessage = [NSString stringWithFormat:@"Reward received %@ , amount %lf"
                               , rewardBasedVideoAd.adNetworkClassName
                               , [reward.amount doubleValue]];
    NSLog(@"rewardMessage : %@", rewardMessage);
}

- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is received.[%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Opened reward based video ad. [%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad started playing.[%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAdDidCompletePlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad has completed. [%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad is closed. [%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd {
    NSLog(@"Reward based video ad will leave application. [%@]", rewardBasedVideoAd.adNetworkClassName);
}

- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error {
    NSLog(@"Reward based video ad failed to load. [%@]", rewardBasedVideoAd.adNetworkClassName);
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

@end
