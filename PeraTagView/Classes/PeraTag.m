//
//  PeraTag.m
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import "PeraTag.h"

@implementation PeraTag

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTaped)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)labelTaped{
    if (self.tapBlock) {
        self.tapBlock(self.text);
    }
}
- (void)configWithText:(NSString *)text leftRightSpace:(CGFloat)leftRightSpacing topBottomSpace:(CGFloat)topBottomSpaciing{
    self.text = text;
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    CGRect frame = self.frame;
    frame.size = CGSizeMake(ceil(size.width) + ceil(leftRightSpacing * 2), ceil(size.height) + ceil(topBottomSpaciing * 2));
    self.frame = frame;
}

@end
