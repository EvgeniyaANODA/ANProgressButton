//
//  ANProgressButton.h
//
//  Created by Oksana Kovalchuk on 11/28/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

static CGFloat kANProgressButtonHeight = 44;
static UIEdgeInsets const kRoundedButtonInsets = {0, 15, 15, 15};

@class ANColorThemeButton;

@interface ANProgressButton : UIButton

@property (nonatomic, strong) UIActivityIndicatorView* indicator;
@property (nonatomic, strong) ANColorThemeButton* theme;

+ (instancetype)buttonWithTheme:(ANColorThemeButton*)theme;

@end
