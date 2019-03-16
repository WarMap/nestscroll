//
//  TitleViewController.m
//  NestScroll
//
//  Created by warmap on 2019/3/16.
//  Copyright © 2019 warmap. All rights reserved.
//

#import "TitleViewController.h"
#import "JXCategoryTitleView.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

- (void)viewDidLoad {
    if (self.titles == nil) {
        self.titles = @[@"螃蟹", @"麻辣小龙虾", @"苹果", @"营养胡萝卜", @"葡萄", @"美味西瓜", @"香蕉", @"香甜菠萝", @"鸡肉", @"鱼", @"海星"];
    }
    
    [super viewDidLoad];
    
    self.myCategoryView.titles = self.titles;
}

- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryTitleView alloc] init];
}

#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}

@end
