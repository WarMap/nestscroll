//
//  MPOneKind.m
//  NestScroll
//
//  Created by warmap on 2019/3/16.
//  Copyright © 2019 warmap. All rights reserved.
//

#import "MPOneKind.h"
#import "MPPageControl.h"
#define screenw [UIScreen mainScreen].bounds.size.width
#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

@interface MPOneKind()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) MPPageControl *pageControl;
@end

@implementation MPOneKind

#pragma mark - JXCategoryListContentViewDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
        [self.pageControl addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"frame = %@", NSStringFromCGRect(self.pageControl.frame));
}
- (void)setupUI {
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.autoresizesSubviews = NO;
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    self.scrollView.frame = CGRectMake(0, 0, screenw, 180);
    for (int i =0; i<5; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
        view.frame = CGRectMake(screenw*i, 0, screenw, 180);
        [self.scrollView addSubview:view];
    }
    self.pageControl.frame = CGRectMake(0, 180, screenw, 20);
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;

}

- (UIView *)listView {
    return self.view;
}

- (void)listDidAppear {}

- (void)listDidDisappear {}


- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] init];
    }
    return _view;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate=self;
        _scrollView.contentSize = CGSizeMake(screenw*5, 0);
    }
    return _scrollView;
}

- (MPPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[MPPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
//        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
//        _pageControl.userInteractionEnabled = FALSE;
    }
    return _pageControl;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {    
    int pageIndex = round(scrollView.contentOffset.x/scrollView.frame.size.width);
    self.pageControl.currentPage = pageIndex;
}
@end
