//
//  PeraTagConfigratiion.h
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PeraTagConfigratiion : NSObject

@property(nonatomic, assign)CGFloat verticalMargin;  //竖直方向顶部和底部到边界距离

@property(nonatomic, assign)CGFloat horizontalMargin; //水平方向左右到边界距离

@property(nonatomic, assign)CGFloat lineSpacing; //tag之间行间距

@property(nonatomic, assign)CGFloat columnsSpacing; //tag之间列间距

@property(nonatomic, assign)CGFloat tagTopBottomSpacing; // tag内部文字上下到边框距离

@property(nonatomic, assign)CGFloat tagLeftRightSpacing; //tag内部文字左右到边框距离

@property(nonatomic, assign)CGFloat textFont; // tag字体大小

@property(nonatomic, strong)UIColor *textColor; //tag文字颜色

@property(nonatomic, strong)UIColor *tagBackgroundColor; //tag背景色

@property(nonatomic, strong)UIColor *borderColor; // tag边框颜色

@property(nonatomic, assign)CGFloat borderWidth; // tag边框宽度

@property(nonatomic, assign)CGFloat cornerRandius; //tag圆角

@property(nonatomic, assign)NSInteger numberOfLine; //显示几行

@property(nonatomic, copy)NSString *ellipsis; //省略 eg ...  等


+ (instancetype)defaultConfig;

@end

NS_ASSUME_NONNULL_END
