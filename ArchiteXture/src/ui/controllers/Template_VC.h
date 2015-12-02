//
//  RingProfile_VC.h
//  ArchiteXture
//
//  Created by Jose Manuel Ramírez Martínez on 30/11/15.
//  Copyright © 2015 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Template_VC : UIView <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *allRingsScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *carouselSV;
@property (weak, nonatomic) IBOutlet UIScrollView *productSV;

@property (nonatomic, assign) CGFloat alpha;

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIImageView *carouselImageView;
@property (weak, nonatomic) IBOutlet UIImageView *smallTitleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bigTitleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blurryBackgroundImageView;

@end
