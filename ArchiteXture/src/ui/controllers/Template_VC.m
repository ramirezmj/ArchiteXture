//
//  RingProfile_VC.m
//  ArchiteXture
//
//  Created by Jose Manuel Ramírez Martínez on 30/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "Template_VC.h"

@interface Template_VC ()

@property (nonatomic, assign) BOOL canAnimate;

@end

@implementation Template_VC

- (id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                                 owner:self
                                               options:nil] firstObject];
    if (!self) return nil;
    return self;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self showBlurryBackgroundInScrollView:scrollView];
}

#pragma mark - Private methods

- (void)showBlurryBackgroundInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 284) {
        [self showBlurryBackground:YES];
    } else {
        [self showBlurryBackground:NO];
    }
    
    if (scrollView.contentOffset.y > 500) {
        [self showSmallNavigationBar:YES];
    } else {
        [self showSmallNavigationBar:NO];
    }
}

- (void)showBlurryBackground:(BOOL)flag
{
    if(flag) {
        [_backgroundImageView setHidden:YES];
        [_blurryBackgroundImageView setHidden:NO];
    } else {
        [_backgroundImageView setHidden:NO];
        [_blurryBackgroundImageView setHidden:YES];
    }
}

- (void)showSmallNavigationBar:(BOOL)flag
{
    if(flag) {
        if (_canAnimate) {
            [_bigTitleImageView setHidden:YES];
            [_smallTitleImageView setHidden:NO];
            [self fadeAnimation:_smallTitleImageView];
            _canAnimate = !_canAnimate;
        }
    } else {
        if (!_canAnimate){
            [_bigTitleImageView setHidden:NO];
            [_smallTitleImageView setHidden:YES];
            [self fadeAnimation:_bigTitleImageView];
            _canAnimate = !_canAnimate;
        }
    }
}

- (void)fadeAnimation:(UIImageView *)imageView
{
    imageView.alpha = 0;
    
    [UIView beginAnimations:@"fade in" context:nil];
    [imageView setAnimationDuration:3.0];
    imageView.alpha = 1.0;
    [UIView commitAnimations];
}

@end
