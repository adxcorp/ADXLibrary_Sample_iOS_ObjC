//
//  AppDelegate.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 23..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "AppDelegate.h"
#import "NativeAdView.h"
#import <ADXLibrary/ADXLibrary.h>
#import <MoPub.h>
#import <FBAudienceNetwork/FBAudienceNetwork.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@import GoogleMobileAds;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (@available(iOS 14, *)) {
        // ATT 알림을 통한 권한 요청
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {

            // 광고추적제한 설정 (페이스북 광고)
            if (ATTrackingManager.trackingAuthorizationStatus == ATTrackingManagerAuthorizationStatusAuthorized ||
               (ATTrackingManager.trackingAuthorizationStatus == ATTrackingManagerAuthorizationStatusNotDetermined)) {
                [FBAdSettings setAdvertiserTrackingEnabled:YES];
            } else {
                [FBAdSettings setAdvertiserTrackingEnabled:NO];
            }
            
            // 광고 SDK 초기화
            [self initializeAdSdk];
        }];
    } else {
        // 광고 SDK 초기화
        [self initializeAdSdk];
    }
    
    return YES;
}

- (void) initializeAdSdk {
    MPMoPubConfiguration *sdkConfig = [[MPMoPubConfiguration alloc] initWithAdUnitIdForAppInitialization:BANNER_AD_UNIT_ID];
    [[MoPub sharedInstance] initializeSdkWithConfiguration:sdkConfig
                                            completion:^{
        [ADXGDPR.sharedInstance showADXConsent:^(ADXConsentState consentState, BOOL success) {
            [[NativeAdFactory sharedInstance] setRenderingViewClass:NATIVE_AD_UNIT_ID
                                                 renderingViewClass:[NativeAdView class]];
        }];
    }];
    
    [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
