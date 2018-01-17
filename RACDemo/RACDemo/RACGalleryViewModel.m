//
//  RACGalleryViewModel.m
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "RACGalleryViewModel.h"
#import "RACPhotoImporter.h"

@interface RACGalleryViewModel ()

@end

@implementation RACGalleryViewModel

- (instancetype)init {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    RAC(self, models) = [self importPhotosSignal];
    return self;
    
}

-(RACSignal *)importPhotosSignal {
    return [[[RACPhotoImporter importPhotos] logError] catchTo:[RACSignal empty]];
}

@end
