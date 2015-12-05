//
//  RingProfile_VC.m
//  ArchiteXture
//
//  Created by Jose Manuel Ramírez Martínez on 30/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "TemplateView.h"

static const CGFloat alphaConstant = 0.05;

@interface TemplateView ()

@property (nonatomic, assign) BOOL canAnimate;
@property (nonatomic, assign) CGFloat i;

@end

@implementation TemplateView

- (id)init
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                                 owner:self
                                               options:nil] firstObject];
    if (!self) return nil;
    _i = 0.0;
    return self;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self animateObjectsInScrollView:scrollView];
}

#pragma mark - Private methods

- (void)animateObjectsInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 150) {
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
        if (_i >= 0.0 && _i < 1.0) {
            _i += alphaConstant;
            _blurryBackgroundImageView.alpha = _i;
        }
    } else {
        if (_i <= 1.1 && _i >= 0.1) {
            _i -= alphaConstant;
            _blurryBackgroundImageView.alpha = _i;
        }
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
    [imageView setAnimationDuration:1.0];
    imageView.alpha = 1.0;
    [UIView commitAnimations];
}

@end
