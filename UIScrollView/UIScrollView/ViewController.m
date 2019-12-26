//
//  ViewController.m
//  UIScrollView
//
//  Created by qiyu on 2019/11/28.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置scrollView代理
    self.scrollView.delegate = self;
    //设置最大最小缩放比例相比原图的倍数
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 5;
    
    //ScrollView中Bounce on scroll指弹簧效果
    
    //设置滚动内容的大小 图片大小
    //不设置默认不可滚动
    self.scrollView.contentSize = CGSizeMake(1920, 1320);
    
    //起始时scrollView中显示内容与原图的偏移
    self.scrollView.contentOffset = CGPointMake(450, 380);
    
    //当拖拽到边缘时，边缘的偏移，不好描述，就是拖到边缘时再拖就可以看见了
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"white.jpg"]];
    
    [self.scrollView addSubview:self.imageView];
}

// any offset changes 一滚动就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// any zoom scale changes 一缩放就会调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// called on start of dragging (may require some time and or distance to move) 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest 即将结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"%s", __func__);
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards 结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"%s", __func__);
}

// called on finger up as we are moving 开始减速 加速拖拽 -> 手指离开 -> 开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// called when scroll view grinds to a halt 完成减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}

// return a view that will be scaled. if delegate returns nil, nothing happens 指定缩放的控件
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

// called before the scroll view begins zooming its content 即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view API_AVAILABLE(ios(3.2)) {
    NSLog(@"%s", __func__);
}

// scale between minimum and maximum. called after any 'bounce' animations 结束缩放
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    NSLog(@"%s", __func__);
}



@end
