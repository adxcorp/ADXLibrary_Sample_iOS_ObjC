//
//  NativeAdView.h
//  ADXLibrary_iOSSample
//
//  Created by Eleanor Choi on 2018. 1. 23..
//  Copyright © 2018년 Eleanor Choi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPNativeAdRendering.h"

@interface NativeAdView : UIView <MPNativeAdRendering>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *callToActionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutlet UIImageView *privacyInformationIconImageView;

- (instancetype)init;

@end
