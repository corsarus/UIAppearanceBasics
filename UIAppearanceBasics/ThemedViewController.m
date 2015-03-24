//
//  ThemedViewController.m
//  UIAppearanceBasics
//
//  Created by Catalin (iMac) on 20/03/2015.
//  Copyright (c) 2015 corsarus. All rights reserved.
//

#import "ThemedViewController.h"
#import "ScreenTitleLabel.h"

@interface ThemedViewController ()

@property (nonatomic, strong) UISlider *slider;

@end

@implementation ThemedViewController

- (UISlider *)slider
{
    if (!_slider) {
        _slider = [[UISlider alloc] init];
        _slider.minimumValue = -5.0;
        _slider.maximumValue = 5.0;
//        self.slider.minimumValueImage = [UIImage imageNamed:@"minus"];
//        self.slider.maximumValueImage = [UIImage imageNamed:@"plus"];
        
        // Place the slider in the center of the screen with Auto Layout
        _slider.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_slider];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_slider]-|"
                                                                          options:NSLayoutFormatAlignAllCenterX
                                                                          metrics:nil
                                                                            views:NSDictionaryOfVariableBindings(_slider)]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1.0
                                                               constant:0.0]];
    }
    
    return _slider;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Change the default tint color color to the main view.
    // It is visible on the slider thumbnails in the Green tab, but not in the Red tab, which uses the thumbnails original color
    self.view.tintColor = [UIColor greenColor];

}

- (void)viewDidAppear:(BOOL)animated
{
    UITabBarController *parentTabBarController = self.tabBarController;
    
    UIColor *navbarBackgroundColor;
    switch (parentTabBarController.selectedIndex) {
        case 0:
            navbarBackgroundColor = [UIColor redColor];
            self.slider.minimumValueImage = [UIImage imageNamed:@"minus"];
            self.slider.maximumValueImage = [UIImage imageNamed:@"plus"];
            break;
        case 1:
            navbarBackgroundColor = [UIColor greenColor];
            self.slider.minimumValueImage = [[UIImage imageNamed:@"minus"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            self.slider.maximumValueImage = [[UIImage imageNamed:@"plus"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            break;
        case 2:
            navbarBackgroundColor = [UIColor blueColor];
            break;
        default:
            self.slider.hidden = YES;
            break;
    }
    
    [[UINavigationBar appearance] setBarTintColor: navbarBackgroundColor];
    UINavigationBar *navbar = self.navigationController.navigationBar;
    [self restoreViewInHierarchy:navbar];
   
    UINavigationItem *navigationItem = self.navigationItem;
    ScreenTitleLabel *titleLabel = [[ScreenTitleLabel alloc] initWithFrame:CGRectMake(0, 0, 64.0, 44.0)];
    NSString *tabTitle = [parentTabBarController.tabBar.items[parentTabBarController.selectedIndex] title];
    titleLabel.title = tabTitle;
    navigationItem.titleView = titleLabel;
    [self restoreViewInHierarchy:titleLabel];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Need to remove the slider from the view when the view disappears
    // In iOS8, there seems to be a bug when the UISlider trackTintColor is set through the appearance proxy
    // The bug makes the track disappear when a view is displayed for the second time, so we have to create the slider again and add it to the view
    [self.slider removeFromSuperview];
    self.slider = nil;
}

- (void)restoreViewInHierarchy:(UIView *)view
{
    UIView *superview = view.superview;
    [view removeFromSuperview];
    [superview addSubview:view];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
