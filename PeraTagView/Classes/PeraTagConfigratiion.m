//
//  PeraTagConfigratiion.m
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import "PeraTagConfigratiion.h"

@implementation PeraTagConfigratiion

+ (instancetype)defaultConfig{
    return [[self alloc]init];
}

-  (id)init{
    if (self = [super init]) {
        _horizontalMargin = 2;
        _verticalMargin = 2;
        _lineSpacing = 7;
        _columnsSpacing = 7;
        _tagBackgroundColor = [UIColor whiteColor];
        _tagLeftRightSpacing = 5;
        _tagTopBottomSpacing = 5;
        _textFont = 12;
        _numberOfLine = 0;
        _borderColor = [UIColor grayColor];
        _borderWidth = 0.5;
        _cornerRandius = 2;
        _ellipsis = @"...";
    
    }
    return self;
}

@end
