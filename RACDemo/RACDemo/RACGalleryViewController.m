//
//  RACGalleryViewController.m
//  RACDemo
//
//  Created by wangyuan on 2018/1/17.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "RACGalleryViewController.h"
#import "RACGalleryFlowLayout.h"
#import "RACGalleryViewModel.h"
#import "GalleryCell.h"

@interface RACGalleryViewController ()

@property(nonatomic, strong) NSArray *photoArray;
@property(nonatomic, strong) RACGalleryViewModel *viewModel;
@end

@implementation RACGalleryViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    RACGalleryFlowLayout *flowLayout = [[RACGalleryFlowLayout alloc] init];
    self = [self initWithCollectionViewLayout:flowLayout];
    if (!self) {
        return nil;
    }
    self.viewModel = [RACGalleryViewModel new];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Popular on 500px";

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    @weakify(self);
    [RACObserve(self.viewModel, models) subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];
    
   
    [[self rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)] subscribeNext:^(RACTuple *arguments) {
        
        @strongify(self);
        NSIndexPath *indexPath = arguments.second;
        
    }];
    
    self.collectionView.delegate = nil;
    self.collectionView.delegate = self;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setPhotoModel:self.viewModel.models[indexPath.row]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
