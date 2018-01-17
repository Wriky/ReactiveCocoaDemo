//
//  RACGalleryFlowLayout.m
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "RACGalleryFlowLayout.h"

@implementation RACGalleryFlowLayout

- (instancetype)init {
    if (!(self = [super init])) {
        return  nil;
    }
    self.itemSize = CGSizeMake(145, 145);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    return self;
}


@end
