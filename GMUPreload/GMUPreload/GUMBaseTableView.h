//
//  GUMBaseTableView.h
//  GMUPreload
//
//  Created by FaceBook on 2018/12/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GUMPreloadTableViewDelegate <NSObject>

/**
 下拉刷新和上提加载回调
 
 @param isRefresh 是否是刷新
 */
- (void)preloadTableViewLoadData:(BOOL)isRefresh;

@end

@interface GUMBaseTableView : UITableView

/**
  存放数据数组
 */
@property (nonatomic, strong) NSMutableArray *souceItems;
@property (nonatomic, weak) id<GUMPreloadTableViewDelegate> preloadTableViewDelegate;

@end

NS_ASSUME_NONNULL_END
