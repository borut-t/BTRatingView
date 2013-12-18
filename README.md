BTRatingView
============

Simple 5 star rating view derived from Ray Wenderlich tutorial: http://bit.ly/1fm1rPB


##Preview
![iPhone portrait](https://github.com/borut-t/BTRatingView/raw/master/Screenshots/app.png)

##Properties
	@property (nonatomic, weak) NSObject <BTRatingViewDelegate> *delegate;

BTRatingView delegate object.

	@property (nonatomic, strong) UIImage *emptyStarImage;

Image placeholder for empty star.

	@property (nonatomic, strong) UIImage *halfFullStarImage;

Image for half full star.

	@property (nonatomic, strong) UIImage *fullStarImage;

Image for full star.

	@property (nonatomic, assign) BOOL editable;

Boolean value if user interaction is enabled.

	@property (nonatomic, assign) CGFloat rating;

Current rating value.

	@property (nonatomic, assign) NSInteger maxRating;

Max rating stars. Defaults to 5.

	@property (nonatomic, assign) NSInteger midMargin;

Mid margin between stars.

	@property (nonatomic, assign) NSInteger leftMargin;

Left margin.

	@property (nonatomic, assign) CGSize minImageSize;

Minimal image size.


## Protocol
	- (void)ratingView:(BTRatingView *)ratingView ratingDidChange:(float)rating;

Delegate method when rating value did change.