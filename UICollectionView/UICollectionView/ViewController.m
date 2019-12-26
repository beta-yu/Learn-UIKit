//
//  ViewController.m
//  UICollectionView
//
//  Created by qiyu on 2019/12/1.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpCollectionFlowLayout];
}

- (void)setUpCollectionFlowLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat width = (UIScreen.mainScreen.bounds.size.width - 3 * 5) * 0.5;
    
    layout.itemSize = CGSizeMake(width, 250); //每个item的size
    layout.minimumLineSpacing = 5; //行间距
    layout.minimumInteritemSpacing = 5; //item间距
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5); //设置四周边距
    
    self.collectionView.collectionViewLayout = layout;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"abc" forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"img%ld", indexPath.item];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}



@end
