//
//  GUMBaseTableView.m
//  GMUPreload
//
//  Created by FaceBook on 2018/12/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "GUMBaseTableView.h"
#import "UIScrollView+GMUPreload.h"
#import <ReactiveObjC.h>
#import "GUMPreloadTableViewCell.h"
@interface GUMBaseTableView ()<
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation GUMBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.souceItems = [NSMutableArray arrayWithCapacity:0];
        
        self.showsVerticalScrollIndicator =NO;
        self.showsHorizontalScrollIndicator =NO;
        
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.preloadMinCount  =@(25);
        @weakify(self);
        self.preloadBlock = ^{
            @strongify(self);
            [self.preloadTableViewDelegate preloadTableViewLoadData:NO];
        };
        
         [self registerClass:[GUMPreloadTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GUMPreloadTableViewCell class])];
    }
    return self;
}

#pragma mark set
-(void)setSouceItems:(NSMutableArray *)souceItems{
    _souceItems = souceItems;
    
    self.datas = souceItems.copy;
    
    [self reloadData];
}

#pragma mark - UITableDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.souceItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    GUMPreloadTableViewCell *cell = [GUMPreloadTableViewCell CellWithTableView:tableView];
    [cell InitDataWithModel:self.souceItems[indexPath.row]];
    [self preloadDataWithCurrentIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}




@end
