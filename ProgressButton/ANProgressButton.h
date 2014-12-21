//
//  CDIndicatorButton.h
//  CtrlDo
//
//  Created by Max Kotelevskiy on 11/28/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

static CGFloat kANProgressButtonHeight = 44;
static UIEdgeInsets const kRoundedButtonInsets = {0, 15, 15, 15};

#import "ANButtonTheme.h"

@interface ANProgressButton : UIButton

@property (nonatomic, strong) UIActivityIndicatorView* indicator;
@property (nonatomic, strong) ANButtonTheme* theme;

+ (instancetype)buttonWithTheme:(ANButtonTheme *)theme;

@end
