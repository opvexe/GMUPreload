//
//  GUMPreloadTableViewCell.h
//  GMUPreload
//
//  Created by FaceBook on 2018/12/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GUMModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GUMPreloadTableViewCell : UITableViewCell

/**
 重用Cell

 @param tableview Tablvew
 @return 重用Cell
 */
+(instancetype)CellWithTableView:(UITableView *)tableview;
/**
 Model赋值

 @param model 数据模型
 */
-(void)InitDataWithModel:(GUMModel *)model;
@end

NS_ASSUME_NONNULL_END
