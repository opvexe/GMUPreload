//
//  GUMPreloadTableViewCell.m
//  GMUPreload
//
//  Created by FaceBook on 2018/12/19.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "GUMPreloadTableViewCell.h"
#import <Masonry.h>
@interface GUMPreloadTableViewCell ()
@property(nonatomic,strong)UILabel *friendsLabel;
@end
@implementation GUMPreloadTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID =@"GUMPreloadTableViewCell";
    GUMPreloadTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[GUMPreloadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle              = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _friendsLabel = ({
            UILabel *iv = [[UILabel alloc]init];
            [self.contentView addSubview:iv];
            iv.textAlignment = NSTextAlignmentLeft;
            iv.font = [UIFont systemFontOfSize:12.0f];
            iv.textColor = [UIColor blackColor];
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(20.0f);
                make.centerY.mas_equalTo(self.contentView);
                make.width.mas_lessThanOrEqualTo(180.0f);
                make.height.mas_equalTo(20.0f);
            }];
            iv;
        });
    }
    return self;
}

-(void)InitDataWithModel:(GUMModel *)model{
    self.friendsLabel.text = model.titles;
}
@end
