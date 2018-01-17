//
//  GalleryCell.m
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "GalleryCell.h"

@interface GalleryCell()
@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation GalleryCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(!self) {
        return nil;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.contentView addSubview:imageView];
    
    self.imageView = imageView;
    
    
    
    
    
    return self;
}

@end
