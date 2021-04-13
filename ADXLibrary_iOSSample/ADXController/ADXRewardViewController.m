//
//  ADXRewardViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 4. 5..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXRewardViewController.h"
#import <MoPub.h>

@interface ADXRewardViewController () <MPRewardedAdsDelegate>
@end

@implementation ADXRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MPRewardedAds setDelegate:self forAdUnitId:REWARDEDVIDEO_AD_UNIT_ID];
    [MPRewardedAds loadRewardedAdWithAdUnitID:REWARDEDVIDEO_AD_UNIT_ID withMediationSettings:nil];
    
}

- (IBAction)selectShowAd:(id)sender {
    
    if ([MPRewardedAds hasAdAvailableForAdUnitID:REWARDEDVIDEO_AD_UNIT_ID]) {
        [MPRewardedAds presentRewardedAdForAdUnitID:REWARDEDVIDEO_AD_UNIT_ID fromViewController:self withReward:nil customData:nil];
    } else {
        [MPRewardedAds loadRewardedAdWithAdUnitID:REWARDEDVIDEO_AD_UNIT_ID withMediationSettings:nil];
    }
}

#pragma mark - MPRewardedAdsDelegate

- (void)rewardedAdDidLoadForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidLoadForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdDidFailToLoadForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"rewardedAdDidFailToLoadForAdUnitID : %@\nerror : %@", adUnitID, error.localizedDescription);
}

- (void)rewardedAdDidExpireForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidExpireForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdDidFailToShowForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    NSLog(@"rewardedAdDidFailToShowForAdUnitID : %@\n error : %@", adUnitID, error.localizedDescription);
}

- (void)rewardedAdWillPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillPresentForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdDidPresentForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidPresentForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdWillDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillDismissForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdDidDismissForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidDismissForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdDidReceiveTapEventForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    NSLog(@"rewardedAdWillLeaveApplicationForAdUnitID : %@", adUnitID);
}

- (void)rewardedAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPReward *)reward {
    NSLog(@"rewardedAdShouldRewardForAdUnitID : %@\n reward : %@", adUnitID, reward.currencyType);
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
