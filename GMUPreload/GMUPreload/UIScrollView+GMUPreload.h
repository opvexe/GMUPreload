//
//  UIScrollView+GMUPreload.h
//  FaceBook
//
//  Created by FaceBook on 2018/12/13.
//  Copyright © 2018 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PreloadBlock)(void);

@interface UIScrollView (GMUPreload)

/**
提前多少值开始预加载
 */
@property(nonatomic,copy)PreloadBlock preloadBlock;

/**
 预加载
 */
@property(nonatomic,strong)NSNumber *preloadMinCount;
/**
 */
@property (nonatomic, strong) NSArray *datas;
/**
 @param currentIndex currentIndex  当前选择位置
 */
- (void)preloadDataWithCurrentIndex:(NSInteger)currentIndex;

@end

NS_ASSUME_NONNULL_END
