//
//  BTRatingView.m
//
//  Version 1.0.1
//
//  Created by Borut Tomazin on 12/18/2013.
//  Copyright 2013 Borut Tomazin
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/borut-t/BTRatingView
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "BTRatingView.h"

@interface BTRatingView()

@property (nonatomic, strong) NSMutableArray *imageViews;

@end

@implementation BTRatingView


- (void)setUp
{
    _emptyStarImage = nil;
    _halfFullStarImage = nil;
    _fullStarImage = nil;
    _rating = 0;
    _editable = NO;
    _imageViews = [[NSMutableArray alloc] init];
    _maxRating = 5;
    _midMargin = 5;
    _leftMargin = 0;
    _minImageSize = CGSizeMake(5, 5);
    _delegate = nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setUp];
    }
    return self;
}

- (void)refresh
{
    for (int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        if (self.rating >= i+1) {
            imageView.image = self.fullStarImage;
        }
        else if (self.rating > i) {
            imageView.image = self.halfFullStarImage;
        }
        else {
            imageView.image = self.emptyStarImage;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.emptyStarImage == nil) {
        return;
    }
    
    CGFloat desiredImageWidth = (self.frame.size.width - (self.leftMargin*2) - (self.midMargin*self.imageViews.count)) / self.imageViews.count;
    CGFloat imageWidth = MAX(self.minImageSize.width, desiredImageWidth);
    CGFloat imageHeight = MAX(self.minImageSize.height, self.frame.size.height);
    
    for (int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        CGRect imageFrame = CGRectMake(self.leftMargin + i*(self.midMargin+imageWidth), 0, imageWidth, imageHeight);
        imageView.frame = imageFrame;
    }
}

- (void)setMaxRating:(NSInteger)maxRating
{
    _maxRating = maxRating;
    
    // Remove old image views
    for (int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = (UIImageView *)[self.imageViews objectAtIndex:i];
        [imageView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    
    // Add new image views
    for (int i = 0; i < maxRating; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageViews addObject:imageView];
        [self addSubview:imageView];
    }
    
    // Relayout and refresh
    [self setNeedsLayout];
    [self refresh];
}

- (void)setNotSelectedImage:(UIImage *)image
{
    _emptyStarImage = image;
    [self refresh];
}

- (void)setHalfSelectedImage:(UIImage *)image
{
    _halfFullStarImage = image;
    [self refresh];
}

- (void)setFullSelectedImage:(UIImage *)image
{
    _fullStarImage = image;
    [self refresh];
}

- (void)setRating:(CGFloat)rating
{
    _rating = rating;
    [self refresh];
}

- (void)handleTouchAtLocation:(CGPoint)touchLocation
{
    if (!self.editable) return;
    
    NSInteger newRating = 0;
    for (NSInteger i = self.imageViews.count - 1; i >= 0; i--) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        if (touchLocation.x > imageView.frame.origin.x) {
            newRating = i+1;
            break;
        }
    }
    
    self.rating = newRating;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate ratingView:self ratingDidChange:self.rating];
}

@end
