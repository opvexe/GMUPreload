//
//  ViewController.m
//  FaceBook
//
//  Created by FaceBook on 2018/12/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//
#define iOS11 @available(iOS 11.0, *)

#import "ViewController.h"
#import "GUMBaseTableView.h"
#import <ReactiveObjC.h>
#import <Masonry.h>
#import <MJRefresh.h>
@interface ViewController ()
<
GUMPreloadTableViewDelegate
>
@property(nonatomic,strong)GUMBaseTableView *listTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预加载";
    [self configView];
}

-(void)configView{
    _listTableView = ({
        GUMBaseTableView *iv = [[GUMBaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:iv];
        iv.preloadTableViewDelegate = self;
        iv.tableFooterView  =[UIView new];
        @weakify(self);
        iv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            [self tableViewDidTriggerHeaderRefresh];
        }];
        iv.mj_header.automaticallyChangeAlpha = YES;
        iv.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
            @strongify(self);
            [self tableViewDidTriggerFooterRefresh];
        }];
        iv.mj_footer.automaticallyChangeAlpha = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            if (iOS11) {
                make.edges.mas_equalTo(self.view.safeAreaInsets);
            }else{
                make.edges.mas_equalTo(self.view);
            }
        }];
        iv;
    });
}

#pragma mark GUMPreloadTableViewDelegate
- (void)preloadTableViewLoadData:(BOOL)isRefresh
{
    
    
}


/**
 上拉刷新
 */
-(void)tableViewDidTriggerHeaderRefresh
{
    
    
}


/**
 下拉加载
 */
-(void)tableViewDidTriggerFooterRefresh
{
    
}
@end
