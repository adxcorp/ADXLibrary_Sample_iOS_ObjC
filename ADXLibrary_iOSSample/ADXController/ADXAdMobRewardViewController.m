//
//  ADXAdMobRewardViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 4. 18..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXAdMobRewardViewController.h"
#import <ADXLibrary/ADXGDPR.h>

@import GoogleMobileAds;

@interface ADXAdMobRewardViewController () <GADFullScreenContentDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;

@end

@implementation ADXAdMobRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createAndLoadRewardedAd];
}

- (void)createAndLoadRewardedAd {
    GADRequest *request = [GADRequest request];
    //*** GDPR
    if ([ADXGDPR.sharedInstance getConsentState] == ADXConsentStateDenied) {
        GADExtras *extras = [[GADExtras alloc] init];
        extras.additionalParameters = @{@"npa": @"1"};
        [request registerAdNetworkExtras:extras];
    }
    
    [GADRewardedAd loadWithAdUnitID:@"ca-app-pub-7466439784264697/6572954274" request:request completionHandler:^(GADRewardedAd *rewardedAd, NSError *error) {
        if (error) {
            NSLog(@"Loading failed");
        } else {
            NSLog(@"Loading Succeeded");
            self.rewardedAd = rewardedAd;
            self.rewardedAd.fullScreenContentDelegate = self;
        }
    }];
}

- (IBAction)selectShowAd:(id)sender {
    if (self.rewardedAd) {
        [self.rewardedAd presentFromRootViewController:self userDidEarnRewardHandler:^{
            GADAdReward *reward = self.rewardedAd.adReward;
            if (reward != nil) {
                NSLog(@"Reward received with currency: %@, amount: %@", reward.type, reward.amount);
            }
        }];
    } else {
        [self createAndLoadRewardedAd];
    }
}


#pragma mark - GADFullScreenContentDelegate

- (void)adDidRecordImpression:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"adDidRecordImpression");
}

- (void)ad:(id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    NSLog(@"Rewarded ad failed to present.");
}

- (void)adDidPresentFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"Rewarded ad presented");
}

- (void)adDidDismissFullScreenContent:(id<GADFullScreenPresentingAd>)ad {
    NSLog(@"adDidDismissFullScreenContent");
    
    [self createAndLoadRewardedAd];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
