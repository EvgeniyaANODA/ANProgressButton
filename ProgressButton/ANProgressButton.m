//
//  ANProgressButton.m
//
//  Created by Oksana Kovalchuk on 11/28/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "ANProgressButton.h"
#import "UIImage+ANAdditions.h"
#import "ReactiveCocoa.h"
#import "Masonry.h"
#import "UIButton+ANThemes.h"
#import "ANProgressButton+ANButtonStateAnimator.h"

@interface ANProgressButton ()

@end

@implementation ANProgressButton

+ (instancetype)buttonWithTheme:(id<ANColorThemeButtonInterface>)theme
{
    ANProgressButton* button = [self buttonWithType:UIButtonTypeCustom];
    button.theme = theme;
    return button;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.adjustsImageWhenHighlighted = NO;
        self.adjustsImageWhenDisabled = NO;
        self.clipsToBounds = YES;
        self.exclusiveTouch = YES;
    }
    return self;
}

#pragma mark - Setters/Getters

- (void)setRac_command:(RACCommand *)rac_command
{
    [super setRac_command:rac_command];
    RACSignal* executing = rac_command.executing;
    [executing subscribeNext:^(NSNumber* x) {
        
        [self bringSubviewToFront:self.indicator];
         x.boolValue ? [self.indicator startAnimating] : [self.indicator stopAnimating];
    } completed:^{
        [self.indicator stopAnimating];
    }];
}

- (void)setIsLoading:(BOOL)isLoading
{
    _isLoading = isLoading;
    if (_isLoading)
    {
        [self.indicator startAnimating];
    }
    else
    {
        [self.indicator stopAnimating];
    }
    self.enabled = !isLoading;
}

- (void)setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setTheme:(ANColorThemeButton *)theme
{
    _theme = theme;
    [self an_updateAppearanceWithTheme:_theme];
}

- (UIActivityIndicatorView *)indicator
{
    if (!_indicator)
    {
        _indicator =
        [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_indicator];
        [_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-10);
        }];
    }
    return _indicator;
}

@end
