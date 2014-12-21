//
//  ANProgressButton+AttributedTitle.m
//
//  Created by Oksana Kovalchuk on 11/28/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "ANProgressButton+AttributedTitle.h"
#import "UIFont+ANAdditions.h"

@implementation ANProgressButton (AttributedTitle)

- (void)an_updateTitleLabelWithLightText:(NSString*)lightText regularText:(NSString*)regularText
{
    if (!lightText) lightText = @"";
    if (!regularText) regularText = @"";
    
    NSString* resultString = [NSString stringWithFormat:@"%@ %@", lightText, regularText];
    
    CGFloat fontSize = 18;
    UIFont* boldFont = [UIFont an_regularFontWithSize:fontSize];
    UIFont* regularFont = [UIFont an_lightFontWithSize:fontSize];
    UIColor* foregroundColor = [UIColor whiteColor];
    
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           regularFont, NSFontAttributeName,
                           foregroundColor, NSForegroundColorAttributeName, nil];
    
    NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                              boldFont, NSFontAttributeName,
                              foregroundColor, NSForegroundColorAttributeName, nil];
    
    NSRange range = [resultString rangeOfString:regularText];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:resultString attributes:attrs];
    [attributedText setAttributes:subAttrs range:range];
    
    [self setAttributedTitle:attributedText forState:UIControlStateNormal];
    [self setTitleColor:foregroundColor forState:UIControlStateNormal];
}

@end
