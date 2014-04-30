//
//  BTRatingView.h
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

@protocol BTRatingViewDelegate;

@interface BTRatingView : UIView

/**
 BTRatingView delegate object.
 */
@property (nonatomic, weak) NSObject <BTRatingViewDelegate> *delegate;

/**
 Image placeholder for empty star.
 */
@property (nonatomic, strong) UIImage *emptyStarImage;

/**
 Image for half full star.
 */
@property (nonatomic, strong) UIImage *halfFullStarImage;

/**
 Image for full star.
 */
@property (nonatomic, strong) UIImage *fullStarImage;

/**
 Boolean value if user interaction is enabled.
 */
@property (nonatomic, assign) BOOL editable;

/**
 Current rating value.
 */
@property (nonatomic, assign) CGFloat rating;

/**
 Max rating stars. Defaults to 5.
 */
@property (nonatomic, assign) NSInteger maxRating;

/**
 Mid margin between stars.
 */
@property (nonatomic, assign) NSInteger midMargin;

/**
 Left margin.
 */
@property (nonatomic, assign) NSInteger leftMargin;

/**
 Minimal image size.
 */
@property (nonatomic, assign) CGSize minImageSize;

@end

@protocol BTRatingViewDelegate

/**
 Delegate method when rating value did change.
 */
- (void)ratingView:(BTRatingView *)ratingView ratingDidChange:(float)rating;

@end
