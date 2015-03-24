//
//  ScreenTitleLabel.m
//  UIAppearanceBasics
//
//  Created by Catalin (iMac) on 21/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "ScreenTitleLabel.h"

@interface ScreenTitleLabel ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ScreenTitleLabel

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];

    NSMutableDictionary *titleTextAttributes = [[NSMutableDictionary alloc] init];
    [titleTextAttributes setObject:[UIFont fontWithName:@"Thonburi" size:16.0] forKey:NSFontAttributeName];
    [titleTextAttributes setObject:@(2.0) forKey:NSKernAttributeName];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [titleTextAttributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    [titleTextAttributes setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:_title attributes:titleTextAttributes];
    
}

@end
