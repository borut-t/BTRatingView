//
//  ViewController.m
//  BTRatingView
//
//  Created by Borut Tomažin on 18/12/13.
//  Copyright (c) 2013 Borut Tomažin. All rights reserved.
//

#import "ViewController.h"
#import "BTRatingView.h"

@interface ViewController () <BTRatingViewDelegate>

@property (nonatomic, strong) IBOutlet BTRatingView *ratingView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.ratingView.delegate = self;
    self.ratingView.emptyStarImage = [UIImage imageNamed:@"rateOff.png"];
    self.ratingView.fullStarImage = [UIImage imageNamed:@"rateOn.png"];
    self.ratingView.editable = YES;
    self.ratingView.maxRating = 5;
    self.ratingView.rating = 2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)ratingView:(BTRatingView *)ratingView ratingDidChange:(float)rating
{
    NSLog(@"RatingDidChange: %f",rating);
}

@end
