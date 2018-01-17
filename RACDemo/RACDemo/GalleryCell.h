//
//  GalleryCell.h
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RACPhotoModel;

@interface GalleryCell : UICollectionViewCell

@property (nonatomic, strong) RACPhotoModel *photoModel;

@end
