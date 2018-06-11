//
//  ADXNativeAdViewController.m
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 23..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import "ADXNativeAdViewController.h"
#import <NativeAdFactory.h>
#import <MPNativeAd.h>
#import "NativeAdView.h"


@interface ADXNativeAdViewController ()<NativeAdFactoryDelegate, MPNativeAdDelegate>

@property (nonatomic) MPNativeAd *nativeAd;
@end

@implementation ADXNativeAdViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NativeAdFactory sharedInstance] removeDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[NativeAdFactory sharedInstance] addDelegate:self];
    [[NativeAdFactory sharedInstance] loadAd:NATIVE_AD_UNIT_ID];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    
    // register renderingViewClass
    [[NativeAdFactory sharedInstance] setRenderingViewClass:NATIVE_AD_UNIT_ID renderingViewClass:[NativeAdView class]];
}

#pragma mark - NativeAdFactoryDelegate

- (void)onSuccess:(NSString *)adUnitId nativeAd:(MPNativeAd *)nativeAd {
    
    if([adUnitId isEqualToString:NATIVE_AD_UNIT_ID]) {
        self.nativeAd = nativeAd;
        self.nativeAd.delegate = self;

        UIView *nativeAdView = [[NativeAdFactory sharedInstance] getNativeAdView:NATIVE_AD_UNIT_ID];

        nativeAdView.frame = CGRectMake(0.0,
                                        100.0,
                                        [UIScreen mainScreen].bounds.size.width,
                                        270.0);
        
        [self.view addSubview:nativeAdView];
    }
}

- (void)onFailure:(NSString *)adUnitId {
    NSLog(@"adUnitId : %@", adUnitId);
    
}

- (void)willPresentModalForNativeAd:(MPNativeAd *)nativeAd {

}

- (void)didDismissModalForNativeAd:(MPNativeAd *)nativeAd {

}

- (void)willLeaveApplicationFromNativeAd:(MPNativeAd *)nativeAd {

}

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
