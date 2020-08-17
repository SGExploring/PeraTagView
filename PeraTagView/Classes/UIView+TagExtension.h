//
//  UIView+TagExtension.h
//  PeraTagView
//
//  Created by 时光 on 2020/8/17.
//  Copyright © 2020 安世亚太. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class PeraTagConfigratiion;
typedef void (^SelectTagBlock)(NSInteger index);

@interface UIView (TagExtension)

- (void)layoutTagsWithTitles:(NSArray *)titles configration:(PeraTagConfigratiion *)config;

- (void)selectedTagWithBlock:(SelectTagBlock)block;

@end

NS_ASSUME_NONNULL_END
