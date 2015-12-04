//
//  ViewController.m
//  BaseProject
//
//  Created by Jose Manuel Ramírez Martínez on 29/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "RingProfile_VC.h"
#import "Template_VC.h"

@interface RingProfile_VC ()

@property (strong, nonatomic) Template_VC *happinessView;
@property (strong, nonatomic) Template_VC *fancyView;

@end

@implementation RingProfile_VC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHapinessRing];
    [self setupFancyRing];
    
    [_fancyView.smallTitleImageView setHidden:YES];
    [_happinessView.smallTitleImageView setHidden:YES];
}

- (void)setupHapinessRing
{
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height);
    
    _happinessView = [[Template_VC alloc] init];
    [_happinessView setFrame:rect];
    
    CGSize size = CGSizeMake(_happinessView.scrollView.bounds.size.width, 4800);
    CGSize carouselSize = CGSizeMake(900, _happinessView.carouselSV.bounds.size.height);
    
    [_happinessView.scrollView setContentSize:size];
    [_happinessView.carouselSV setContentSize:carouselSize];
    [_happinessView.productSV setContentSize:carouselSize];
    
    [self.view addSubview:_happinessView];
}

- (void)setupFancyRing
{
    CGRect rect = CGRectMake(self.view.bounds.size.width, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height);
    
    _fancyView = [[Template_VC alloc] init];
    [_fancyView setFrame:rect];
    
    
    _fancyView.titleImageView.image = [UIImage imageNamed:@"FANCY"];
    _fancyView.infoImageView.image = [UIImage imageNamed:@"FANCY_INFO_AN"];
    _fancyView.mapImageView.image = [UIImage imageNamed:@"FANCY_MAP"];
    _fancyView.productImageView.image = [UIImage imageNamed:@"FANCY_PRODUCT"];
    _fancyView.carouselImageView.image = [UIImage imageNamed:@"FANCY_TIRA_IMATGES"];
    _fancyView.smallTitleImageView.image = [UIImage imageNamed:@"FANCY_TITLE_SMALL"];
    _fancyView.bigTitleImageView.image = [UIImage imageNamed:@"FANCY_TITLE_BIG"];
    _fancyView.backgroundImageView.image = [UIImage imageNamed:@"FANCY00"];
    _fancyView.blurryBackgroundImageView.image = [UIImage imageNamed:@"FANCY19"];
    
    
    CGSize size = CGSizeMake(_fancyView.scrollView.bounds.size.width, 4800);
    CGSize carouselSize = CGSizeMake(900, _fancyView.carouselSV.bounds.size.height);
    
    [_fancyView.scrollView setContentSize:size];
    [_fancyView.carouselSV setContentSize:carouselSize];
    [_fancyView.productSV setContentSize:carouselSize];
    
    
    [_happinessView.allRingsScrollView setContentSize:CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height)];
    
    [self.happinessView.allRingsScrollView addSubview:_fancyView];
}

@end
