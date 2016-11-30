//
//  TTips.m
//  TipsDemo
//
//  Created by 唐俊杰 on 16/11/29.
//  Copyright © 2016年 MissTjj. All rights reserved.
//

#import "TTips.h"
#import <UIKit/UIKit.h>

static const CGFloat tLeftScreenDistance = 40;
static const CGFloat tTipsMaxHeight = 60;
static const CGFloat tTipsMargin = 10;
static const CGFloat tPortraitDistance = 45;

@interface TTips (){
    UILabel * _tipsLabel;
    UIButton *_tipsButton;
    CGFloat _duration;
}

@end

@implementation TTips

+ (TTips *)showMessages:(NSString *)messages duration:(NSTimeInterval)time{
    TTips * tips = nil;
    if (messages.length > 0) {
        tips = [[TTips alloc] initWithText:messages duration:time];
    }
    return tips;
    
}

- (id)initWithText:(NSString *)text duration:(int)duration{
    self = [super init];
    if (self) {
        _duration = duration;
        UIFont * font = [UIFont boldSystemFontOfSize:14.0];
        CGSize textSize = [text sizeWithFont:font constrainedToSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - tLeftScreenDistance, tTipsMaxHeight)];
        _tipsLabel =[[UILabel alloc]initWithFrame:CGRectZero];
        _tipsLabel.frame = CGRectMake(tTipsMargin/2, tTipsMargin/ 2, textSize.width + tTipsMargin , textSize.height + tTipsMargin);
        _tipsLabel.text = text;
        _tipsLabel.font = font;
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.shadowColor = [UIColor lightGrayColor];
        _tipsLabel.backgroundColor = [UIColor clearColor];
        _tipsLabel.clipsToBounds = YES;
        
        
        _tipsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tipsButton.frame = CGRectMake(0, 0, _tipsLabel.frame.size.width + tTipsMargin, _tipsLabel.frame.size.height + tTipsMargin);
        _tipsButton.backgroundColor = [UIColor lightGrayColor];
        _tipsButton.layer.masksToBounds = YES;
        _tipsButton.layer.cornerRadius = 3;
        [_tipsButton addSubview:_tipsLabel];
        [self setOrientationLayoutSubviews:[[UIApplication sharedApplication] statusBarOrientation]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationWillChange:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
        
        [[[UIApplication sharedApplication]keyWindow] addSubview:_tipsButton];
    }
    return self;
}

- (void)statusBarOrientationWillChange:(NSNotification *)notification {
    
    if ([_tipsButton superview]) {
        [_tipsButton removeFromSuperview];
    }
    UIInterfaceOrientation orientation = [[notification.userInfo objectForKey:UIApplicationStatusBarOrientationUserInfoKey] intValue];
    [self setOrientationLayoutSubviews:orientation];
}


- (void)setOrientationLayoutSubviews:(UIInterfaceOrientation)orientation {
    
    CGPoint point = [UIApplication sharedApplication].keyWindow.center;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        _tipsButton.center = CGPointMake(point.x, tPortraitDistance);
        [self performSelector:@selector(hide:) withObject:nil afterDelay:(_duration / 1000)];
        return;
    }
    //ios8以下
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
        {
            _tipsButton.transform = CGAffineTransformMakeRotation(0);
            _tipsButton.center = CGPointMake(point.x, tPortraitDistance);
        }
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            _tipsButton.transform = CGAffineTransformMakeRotation(-M_PI);
            _tipsButton.center = CGPointMake(point.x,point.y*2- tPortraitDistance);
        }
            break;
        case UIInterfaceOrientationLandscapeLeft:
        {
            
            _tipsButton.transform = CGAffineTransformMakeRotation(-M_PI_2);
            _tipsButton.center = CGPointMake(tPortraitDistance, point.y);
        }
            break;
        case UIInterfaceOrientationLandscapeRight:
        {
            _tipsButton.transform = CGAffineTransformMakeRotation(M_PI_2);
            _tipsButton.center = CGPointMake(2*point.x - tPortraitDistance, point.y);
        }
            break;
        default:
            break;
    }
    
    [self performSelector:@selector(hide:) withObject:nil afterDelay:(_duration / 1000)];
}


- (void)hide:(id)sender {
    [_tipsButton removeFromSuperview];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
