//
//  ListView.m
//  NestScroll
//
//  Created by warmap on 2019/3/15.
//  Copyright © 2019 warmap. All rights reserved.
//

#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R green:G blue:B alpha:A]

#import "ListView.h"

@implementation ListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_WITH_RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
    }
    return self;
}

#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self;
}

- (void)listDidAppear {}

- (void)listDidDisappear {}


@end
