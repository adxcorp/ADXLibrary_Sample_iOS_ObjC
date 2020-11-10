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

@interface ADXAdMobRewardViewController () <GADRewardedAdDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;

@end

@implementation ADXAdMobRewardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.rewardedAd = [self createAndLoadRewardedAd];

}

- (IBAction)selectShowAd:(id)sender {
    if (self.rewardedAd.isReady) {
      [self.rewardedAd presentFromRootViewController:self delegate:self];
    } else {
      NSLog(@"Ad wasn't ready");
      self.rewardedAd = [self createAndLoadRewardedAd];
    }
}

- (GADRewardedAd *)createAndLoadRewardedAd {
  GADRewardedAd *rewardedAd = [[GADRewardedAd alloc]
      initWithAdUnitID:@"ca-app-pub-7466439784264697/6572954274"];
                               
  GADRequest *request = [GADRequest request];
  //*** GDPR
  if ([ADXGDPR.sharedInstance getConsentState] == ADXConsentStateDenied) {
        GADExtras *extras = [[GADExtras alloc] init];
        extras.additionalParameters = @{@"npa": @"1"};
        [request registerAdNetworkExtras:extras];
  }
    
  [rewardedAd loadRequest:request completionHandler:^(GADRequestError * _Nullable error) {
    if (error) {
      // Handle ad failed to load case.
    } else {
      // Ad successfully loaded.
    }
  }];
  return rewardedAd;
}

/// Tells the delegate that the user earned a reward.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd userDidEarnReward:(GADAdReward *)reward {
  // TODO: Reward the user.
  NSLog(@"rewardedAd:userDidEarnReward:");
}

/// Tells the delegate that the rewarded ad was presented.
- (void)rewardedAdDidPresent:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidPresent:");
}

/// Tells the delegate that the rewarded ad failed to present.
- (void)rewardedAd:(GADRewardedAd *)rewardedAd didFailToPresentWithError:(NSError *)error {
  NSLog(@"rewardedAd:didFailToPresentWithError");
}

/// Tells the delegate that the rewarded ad was dismissed.
- (void)rewardedAdDidDismiss:(GADRewardedAd *)rewardedAd {
  NSLog(@"rewardedAdDidDismiss:");
    
  self.rewardedAd = [self createAndLoadRewardedAd];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

@end
