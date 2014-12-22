//
//  ANProgressButton.m
//
//  Created by Oksana Kovalchuk on 11/28/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "ANProgressButton.h"
#import "UIImage+ANAdditions.h"
#import "UIFont+ANAdditions.h"
#import "ReactiveCocoa.h"
#import "Masonry.h"
#import "ANColorThemeButton.h"

@interface ANProgressButton ()

@end

@implementation ANProgressButton

+ (instancetype)buttonWithTheme:(ANColorThemeButton *)theme
{
    ANProgressButton* button = [ANProgressButton buttonWithType:UIButtonTypeCustom];
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
    }
    return self;
}

#pragma mark - Setters/Getters

- (void)setRac_command:(RACCommand *)rac_command
{
    [super setRac_command:rac_command];
    RACSignal* executing = rac_command.executing;
    [executing subscribeNext:^(NSNumber* x)
    {
        [self bringSubviewToFront:self.indicator];
         x.boolValue ? [self.indicator startAnimating] : [self.indicator stopAnimating];
    } completed:^{
        [self.indicator stopAnimating];
    }];
}

- (void)setTheme:(ANColorThemeButton *)theme
{
    _theme = theme;
    [self setTitleColor:theme.normalStateFontColor forState:UIControlStateNormal];
    [self setTitleColor:theme.selectedStateFontColor forState:UIControlStateSelected];
    [self setTitleColor:theme.selectedStateFontColor forState:UIControlStateHighlighted];
    [self setTitleColor:theme.disabledStateFontColor forState:UIControlStateDisabled];
    
    [self setBackgroundImage:[UIImage an_imageWithColor:theme.normalStateBackground] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage an_imageWithColor:theme.selectedStateBackground] forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage an_imageWithColor:theme.selectedStateBackground] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage an_imageWithColor:theme.disabledStateBackground] forState:UIControlStateDisabled];
    
    self.layer.borderColor = theme.borderColor.CGColor;
    self.layer.borderWidth = theme.borderWidth;
    self.layer.cornerRadius = theme.cornerRadius;
    self.titleLabel.font = theme.titleLabelFont;
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
