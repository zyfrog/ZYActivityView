//
//  YActivityView.m
//  YAroundMe_Telecom
//
//  Created by Hugh on 10/14/10.
//  Copyright 2010 上海一键通信科技有限公司_Hugh_Zhong. All rights reserved.
//

#import "ZYActivityView.h"
#import <QuartzCore/QuartzCore.h>

@interface ZYActivityView()
{
    UIImageView*    _loadImageView;
    NSTimer*        _timer;
}
- (void)rollImage;
@end
@implementation ZYActivityView

- (id)initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame] )
    {
        CGRect rect = [[UIScreen mainScreen] bounds];
		self.frame = rect;
		self.backgroundColor = [UIColor clearColor];
        
        UIView* foreground = [[UIView alloc] initWithFrame:CGRectMake(80, 160, 160, 90)];
        foreground.backgroundColor = [UIColor colorWithRed:0xEA/255.0 green:0xEA/255.0 blue:0xEA/255.0 alpha:1.0f];
        foreground.layer.cornerRadius = 5;
        foreground.layer.borderColor = [UIColor colorWithRed:0x07/255.0 green:0x07/255.0 blue:0x07/255.0 alpha:1.0f].CGColor;
        foreground.layer.borderWidth = 1;
        foreground.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:foreground.bounds cornerRadius:5].CGPath;
        foreground.layer.shadowColor = [UIColor grayColor].CGColor;
        foreground.layer.shadowOpacity = 0.6;
        foreground.layer.shadowOffset = CGSizeMake(0, 1);
        [self addSubview:foreground];
        [foreground release];
		
		UILabel *instructionL = [[UILabel alloc] init];
		instructionL.backgroundColor = [UIColor clearColor];
		instructionL.text = @"请稍后";
		instructionL.textColor = [UIColor blackColor];
		instructionL.font = [UIFont boldSystemFontOfSize:18];
		instructionL.textAlignment = UITextAlignmentCenter;
        instructionL.frame = CGRectMake(0, 50, foreground.bounds.size.width, 40);
		[foreground addSubview:instructionL];
		[instructionL release];
		
        UIImage* loadImage = [UIImage imageNamed:@"load.png"];

		_loadImageView = [[UIImageView alloc] initWithImage:loadImage];
        _loadImageView.frame = CGRectMake((foreground.bounds.size.width - loadImage.size.width) * 0.5,
                                          15,
                                          loadImage.size.width,
                                          loadImage.size.height);
        [foreground addSubview:_loadImageView];
        [_loadImageView release];
        
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 / 20 target:self selector:@selector(rollImage) userInfo:nil repeats:YES];
        [_timer retain];
    }
    return self;
}


- (void)rollImage
{
    static int degree = 10;
    _loadImageView.transform = CGAffineTransformMakeRotation( degree * M_PI/ 180 );
    degree += 10;
}

- (void)stopRollImage
{
    [_timer invalidate];
	[_timer release];
    _timer = nil;
}



- (void)dealloc {
    [_timer invalidate];
	[_timer release];
    _timer = nil;
    [super dealloc];
}



@end
