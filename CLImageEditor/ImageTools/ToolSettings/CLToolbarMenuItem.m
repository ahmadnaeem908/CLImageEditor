//
//  CLToolbarMenuItem.m
//
//  Created by sho yakushiji on 2013/12/11.
//  Copyright (c) 2013年 CALACULU. All rights reserved.
//

#import "CLToolbarMenuItem.h"

#import "CLImageEditorTheme+Private.h"
#import "UIView+Frame.h"

@implementation CLToolbarMenuItem
{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconImageContentMode = UIViewContentModeScaleAspectFill;
        CGFloat W = frame.size.width;
        
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, W-20, W-20)];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 5;
        _iconView.contentMode = self.iconImageContentMode;
        [self addSubview:_iconView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _iconView.bottom + 5, W, 15)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [CLImageEditorTheme toolbarTextColor];
        _titleLabel.font = [CLImageEditorTheme toolbarTextFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action toolInfo:(CLImageToolInfo*)toolInfo
{
    self = [self initWithFrame:frame];
    if(self){
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [self addGestureRecognizer:gesture];
        
        self.toolInfo = toolInfo;
    }
    return self;
}

- (NSString*)title
{
    return _titleLabel.text;
}

- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

- (UIImageView*)iconView
{
    return _iconView;
}

- (UIImage*)iconImage
{
    return _iconView.image;
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconView.image = iconImage;
}

- (void)setIconImageContentMode:(UIViewContentMode)iconImageContentMode
{
    _iconView.contentMode = iconImageContentMode;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    [super setUserInteractionEnabled:userInteractionEnabled];
    self.alpha = (userInteractionEnabled) ? 1 : 0.3;
}

- (void)setToolInfo:(CLImageToolInfo *)toolInfo
{
    [super setToolInfo:toolInfo];
    
    self.title = self.toolInfo.title;
    if(self.toolInfo.iconImagePath){
        self.iconImage = self.toolInfo.iconImage;
    }
    else{
        self.iconImage = nil;
    }
//    self.iconImage = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
    [self setIconImageCustom];
  
}

- (void)setSelected:(BOOL)selected
{
    if(selected != _selected){
        _selected = selected;
        if(selected){
            self.backgroundColor = [CLImageEditorTheme toolbarSelectedButtonColor];
        }
        else{
            self.backgroundColor = [UIColor clearColor];
        }
    }
}

- (void) setIconImageCustom
{
    
    UIImage* image;
    if   ([self.title  isEqual: @"Filter"] ) {
        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    }else  if   ([self.title  isEqual: @"Adjustment"] ) {
//        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    }else  if   ([self.title  isEqual: @"Effect"] ) {
//        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    }else  if   ([self.title  isEqual: @"Blur & Focus"] ) {
//        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    }else  if   ([self.title  isEqual: @"Draw"] ) {
//        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    } else  if   ([self.title  isEqual: @"ToneCurve"] ) {
//        image  = [UIImage imageNamed:@"CLImageEditorPhoto.png"];
        
        
    }
     
    CGImageRef cgref = [image CGImage];
    CIImage *cim = [image CIImage];
    
    if (cim != nil || cgref != NULL)
    {
        _iconView.image = image;
        NSLog(@"found image for",self.title);
        self.title = @"My Filter";
    }
}

@end
 

