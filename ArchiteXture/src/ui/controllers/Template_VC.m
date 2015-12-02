//
//  RingProfile_VC.m
//  ArchiteXture
//
//  Created by Jose Manuel Ramírez Martínez on 30/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "Template_VC.h"

@interface Template_VC ()

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
    if (scrollView.contentOffset.y > 284) {
        [self showBlurryBackground:YES];
    } else {
        [self showBlurryBackground:NO];
    }
    
    if (scrollView.contentOffset.y > 100) {
        [self showSmallNavigationBar:YES];
    } else {
        [self showSmallNavigationBar:NO];
    }
}

#pragma mark - Private methods

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
        [_bigTitleImageView setHidden:YES];
        [_smallTitleImageView setHidden:NO];
    } else {
        [_bigTitleImageView setHidden:NO];
        [_smallTitleImageView setHidden:YES];
    }
}

@end
