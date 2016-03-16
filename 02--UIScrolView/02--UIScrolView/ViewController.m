//
//  ViewController.m
//  02--UIScrolView
//
//  Created by 千锋 on 16/2/29.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建UIScrollView的对象
    UIScrollView * scroll=[[UIScrollView alloc] initWithFrame:self.view.frame];
    //2.添加到界面上
    [self.view addSubview:scroll];
    //3.设置背景色
    scroll.backgroundColor=[UIColor cyanColor];
    //4.添加一张图片在滚动视图上
    
    UIImage * image=[UIImage imageNamed:@"1092.jpg"];
    //使用图片的大小去创建图片视图
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image=image;
    //将图片视图添加到scroll视图上
    [scroll addSubview:imageView];
     
    /*
    for (int i=0; i<10; i++) {
        UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"15_%d.jpg",i+1]];
        UIImageView * imageView=[[UIImageView alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image=image;
        [scroll addSubview:imageView];
        
        
    }
    */
    //！！！！5.设置内容大小
    //内容大小默认和滚动视图的frame一样大
    //当内容的宽度大于滚动视图的frame宽度的时候，滚动视图可以左右滑动；当内容的高度大于滚动视图的frame高度的时候，滚动视图可以上下滑动
    scroll.contentSize=image.size;
//    scroll.contentSize=CGSizeMake(self.view.frame.size.width*10, self.view.frame.size.height+1);
    
    //6.！！！！设置偏移量
    scroll.contentOffset=CGPointMake(0,0);
    //设置偏移量，带有动画效果
    [scroll setContentOffset:CGPointMake(100, 100) animated:YES];
    
    
    //7.设置间距
    //滚动视图停止滚动后 滚动视图的内容视图距离滚动视图的上下左右的边距
    //top、left、buttom、right
    [scroll setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    //8.方向锁定，默认是NO
    //如果是YES，只能在上下或者左右一个方向滑动
    scroll.directionalLockEnabled=NO;
    //9.YES：在内容视图没有超出滚动视图的边界的时候可以有一段缓冲区以供拖动，然后会弹回。
    //  NO：在内容视图没有超出滚动视图的边界的时候 没有一段缓冲区以供拖动
    // 默认为YES
    scroll.bounces=YES;
    
    //！！10.设置是否可以分页  默认是NO
    //如果设置成YES：每次拖 滚动视图，滚动视图滚动的距离在X方向是滚动视图的frame的宽度，在Y方向是滚动视图的frame的高度
    scroll.pagingEnabled=NO;
    
    //11.设置是否可以滚动(默认是YES）
    //设置成NO，滚动视图不能滚动
    scroll.scrollEnabled=YES;

    //12.是否显示滚动条(默认是YES)
    //设置是否显示横向滚动条
    scroll.showsHorizontalScrollIndicator=YES;
    //设置是否显示纵向滚动条
    scroll.showsVerticalScrollIndicator=YES;
    
    //13.设置滚动条的边距
    scroll.scrollIndicatorInsets=UIEdgeInsetsMake(101, 100, 30, 40);
    
    //14.设置滚动条样式
//    UIScrollViewIndicatorStyleDefault,     默认：灰色
//    UIScrollViewIndicatorStyleBlack,      黑色
//    UIScrollViewIndicatorStyleWhite       白色
    [scroll setIndicatorStyle:UIScrollViewIndicatorStyleBlack];
    
    //15.设置是否可以滚动到顶部
    //YES:当点击屏幕的顶部的时候，滚动视图的内容视图会自动滚动到顶部
    scroll.scrollsToTop=NO;
    
    //16.！！！！设置代理
    scroll.delegate=self;
    
    //17.设置缩放比例（默认是1）
    //想要让内容缩放，需要告诉滚动视图到底要对哪个子视图进行缩放(滚动视图本身是不能缩放)
    scroll.maximumZoomScale=5.0;
    scroll.minimumZoomScale=0.01;
}

#pragma mark - 实现协议方法
//滚动视图正在滚动的时候，会实时调用这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"正在滚动");
}

//手指在拖动滚动视图的时候回调用这个方法(滚动将要开始)
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"将要开始拖拽");
}

//将要放手的时候会调用方法,而不是停止滚动的时候
//参数1：当前的委托(滚动视图)
//参数2：加速度(x和y方向的)
//参数3：预测的停止滚动时的偏移量
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"%@",NSStringFromCGPoint(* targetContentOffset));
    NSLog(@"将要结束拖拽");
}

//手已经离开屏幕的时候调用这个方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"停止拖拽");
}

//手已经离开屏幕的时候调用这个方法
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"将要减速");
}

//停止滚动的时候回调用这个方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"停止减速");
}

//通过调用setContentSet:animation：这个方法让滚动视图滚动停止的时候才会调用这个方法
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"已经结束滚动动画");
}

//告诉滚动视图器，两个手指在滚动视图进行缩放操作的时候需要对哪个子视图进行缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //返回值必须是滚动视图上的子视图
    return scrollView.subviews[0];
}
@end
