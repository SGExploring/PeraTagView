//
//  UIView+TagExtension.m
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import "UIView+TagExtension.h"
#import "PeraTagConfigratiion.h"
#import "PeraTag.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
static const char tagBlockKey;
@implementation UIView (TagExtension)

- (void)selectedTagWithBlock:(SelectTagBlock)block{
    if (block) {
        objc_setAssociatedObject(self, &tagBlockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)layoutTagsWithTitles:(NSArray *)titles configration:(PeraTagConfigratiion *)config{
    
    [self layoutIfNeeded];
    [self removeAllSubviews];
    PeraTag *endTag = nil;
    if (config.numberOfLine  != 0) {
        endTag = [[PeraTag alloc]init];
        endTag.font = [UIFont systemFontOfSize:config.textFont];
        [endTag configWithText:config.ellipsis leftRightSpace:config.tagLeftRightSpacing topBottomSpace:config.tagTopBottomSpacing];
    }
    CGFloat maxWidth = self.frame.size.width - config.horizontalMargin * 2;
    CGFloat currentWidth = 0;  //当前宽度
    NSInteger currentLine = 0;
    BOOL willBreak = NO;
    BOOL changeLine  = NO;
    UIView *last;
    
    for (int i = 0; i < titles.count; i++) {
        PeraTag *tag = [[PeraTag alloc]init];
        tag.tapBlock = ^(NSString * _Nullable title) {
            SelectTagBlock block = objc_getAssociatedObject(self,&tagBlockKey);
            if (block) {
                block([titles indexOfObject:title]);
            }
        };
        tag.font = [UIFont systemFontOfSize:config.textFont];
        tag.textColor = config.textColor;
        tag.backgroundColor = config.tagBackgroundColor;
        tag.textAlignment = NSTextAlignmentCenter;
        tag.layer.cornerRadius  =  config.cornerRandius;
        tag.layer.borderColor = config.borderColor.CGColor;
        tag.layer.borderWidth = config.borderWidth;
        [tag configWithText:titles[i] leftRightSpace:config.tagLeftRightSpacing topBottomSpace:config.tagTopBottomSpacing];
        [self addSubview:tag];
        //单个宽度大于view宽度，使其相等
        if (tag.frame.size.width > maxWidth) {
            CGRect frame = tag.frame;
            frame.size.width = maxWidth;
            tag.frame = frame;
        }
        currentWidth += (i == 0 ? tag.frame.size.width : (tag.frame.size.width + config.columnsSpacing));
        //不去做限制，有多少显示多少
        if (config.numberOfLine == 0) {
            //如果当前
            if (currentWidth > maxWidth) {
                changeLine = YES;
                currentWidth = tag.frame.size.width;
                currentLine ++;
            }else{
                changeLine = NO;
            }
        }
        //需要限制加...
        else{
            
            if (currentLine + 1 == config.numberOfLine) {
                changeLine = NO;
                //在当前line中断以后布局,需要判断是不是最后一个，最后一个能不能放下
                if (i == titles.count - 1) {
                    
                    if (currentWidth > maxWidth) {
                        //放不下最后一个
                        if (currentWidth > maxWidth - (endTag.frame.size.width + config.columnsSpacing)) {
                            //将当前tag替换成更多标识
                            [tag configWithText:config.ellipsis leftRightSpace:config.tagLeftRightSpacing topBottomSpace:config.tagTopBottomSpacing];
                            willBreak = YES;
                        }else{
                            //不做处理正常布局
                        }
                    }
                }else{
                    if (currentWidth > maxWidth - (endTag.frame.size.width + config.columnsSpacing)) {
                        //不在去布局
                        [tag configWithText:config.ellipsis leftRightSpace:config.tagLeftRightSpacing topBottomSpace:config.tagTopBottomSpacing];
                        willBreak = YES;
                    }
                }
            }else{
                //正常显示
                if (currentWidth > maxWidth) {
                    changeLine = YES;
                    currentWidth = tag.frame.size.width;
                    currentLine ++;
                }else{
                    changeLine = NO;
                }
                
            }
            
            
        }
        
        [tag mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.mas_offset(config.horizontalMargin);
                make.top.mas_offset(config.verticalMargin);
            }else{
                if (changeLine == NO) {
                    make.left.mas_equalTo(last.mas_right).offset(config.columnsSpacing);
                    make.top.mas_equalTo(last);
                }else{
                    make.left.mas_offset(config.horizontalMargin);
                    make.top.mas_equalTo(last.mas_bottom).offset(config.lineSpacing);
                }
            }
            
            make.size.mas_equalTo(tag.frame.size);
            
            if (i == titles.count - 1 || willBreak) {
                make.bottom.mas_offset(-config.verticalMargin);
            }
        }];
        
        if (willBreak) {
            break;
        }
        
        last = tag;
        
    }
    
    
}
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView *child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
@end
