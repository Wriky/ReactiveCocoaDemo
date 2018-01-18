//
//  GalleryCell.m
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "GalleryCell.h"
#import "RACPhotoModel.h"
#import "NSData+AFDecompression.h"

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
    
    RAC(self.imageView, image) = [[[RACObserve(self, photoModel.thumbnailData) ignore:nil] map:^id(id value) {
        return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [value af_decompressedImageFromJPEGDataWithCallback:
             ^(UIImage *decompressedImage) {
                 [subscriber sendNext:decompressedImage];
                 [subscriber sendCompleted];
             }];
            return nil;
        }] subscribeOn:[RACScheduler scheduler]];
    }] switchToLatest];
    
    [self.rac_prepareForReuseSignal subscribeNext:^(id x) {
        self.imageView.image = nil;
    }];
    
    return self;
}

@end
