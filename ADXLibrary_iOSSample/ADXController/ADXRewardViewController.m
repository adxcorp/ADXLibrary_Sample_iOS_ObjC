//
//  ADXRewardViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 4. 5..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXRewardViewController.h"
#import <MoPub.h>

@interface ADXRewardViewController () <MPRewardedVideoDelegate>
@end

@implementation ADXRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MPRewardedVideo setDelegate:self forAdUnitId:REWARDEDVIDEO_AD_UNIT_ID];
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:REWARDEDVIDEO_AD_UNIT_ID withMediationSettings:nil];
    
}

- (IBAction)selectShowAd:(id)sender {
    
    if ([MPRewardedVideo hasAdAvailableForAdUnitID:REWARDEDVIDEO_AD_UNIT_ID]) {
        [MPRewardedVideo presentRewardedVideoAdForAdUnitID:REWARDEDVIDEO_AD_UNIT_ID fromViewController:self withReward:nil customData:nil];
    } else {
        [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:REWARDEDVIDEO_AD_UNIT_ID withMediationSettings:nil];
    }
}

#pragma mark - MPRewardedVideoDelegate

- (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"adUnitID : %@\nerror : %@", adUnitID, error.localizedDescription);
}

- (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdDidFailToPlayForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"adUnitID : %@\n error : %@", adUnitID, error.localizedDescription);
}

- (void)rewardedVideoAdWillAppearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdDidAppearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdWillDisappearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdDidDisappearForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    NSLog(@"adUnitID : %@", adUnitID);
}

- (void)rewardedVideoAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPRewardedVideoReward *)reward {
    NSLog(@"adUnitID : %@\n reward : %@", adUnitID, reward.currencyType);
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
