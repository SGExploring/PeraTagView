//
//  PeraTag.h
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TapBlock)(NSString * _Nullable title);
NS_ASSUME_NONNULL_BEGIN

@interface PeraTag : UILabel

@property(nonatomic, copy)TapBlock tapBlock;

- (void)configWithText:(NSString *)text leftRightSpace:(CGFloat)leftRightSpacing topBottomSpace:(CGFloat)topBottomSpaciing;

@end

NS_ASSUME_NONNULL_END
