//
//  CanadaCell.m
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import "CanadaCell.h"
#import "Masonry.h"

@implementation CanadaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        // image
        UIImageView *imageHref = [[UIImageView alloc] init];
        self.imageHref = imageHref;
        [self.contentView addSubview:imageHref];
        [imageHref mas_makeConstraints:^(MASConstraintMaker *make) {
            // right
            make.right.mas_equalTo(-15);
            // top
            make.top.mas_equalTo(40);
            // size
            make.size.mas_equalTo(CGSizeMake(80, 45));
        }];

        // title
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textColor = [UIColor blueColor];
        titleLab.font = [UIFont systemFontOfSize:15];
        self.titleLab = titleLab;
        [self.contentView addSubview:titleLab];
        // masonry
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            // left
            make.left.mas_equalTo(15);
            // right
            make.right.mas_equalTo(-15);
            // top
            make.top.mas_equalTo(15);
            // height
            make.height.mas_equalTo(15);
        }];

        // desc
        UILabel *descLab = [[UILabel alloc] init];
        descLab.textColor = [UIColor blackColor];
        descLab.font = [UIFont systemFontOfSize:15];
        descLab.numberOfLines = 0;
        descLab.lineBreakMode = NSLineBreakByWordWrapping;
        self.descLab = descLab;
        [self.contentView addSubview:descLab];
        // masonry
        [descLab mas_makeConstraints:^(MASConstraintMaker *make) {
            // left
            make.left.mas_equalTo(15);
            // right
            make.right.mas_equalTo(imageHref.mas_left).mas_offset(-10);
            // top
            make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(10);
        }];

        UILabel *line = [[UILabel alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
        // maosnry
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            // left
            make.left.mas_equalTo(15);
            // right
            make.right.mas_equalTo(0);
            // bottom
            make.bottom.mas_equalTo(0);
            // height
            make.height.mas_equalTo(1);
        }];
    }

    return self;
}


- (void)setMode:(CanadaModel *)mode {
    [UIImageView SD_setImageView:self.imageHref url:mode.imageHref placeholderImage:[UIImage imageNamed:@"placeholder.jpg"] imageViewOptions:SDWebImageRetryFailed];
    self.titleLab.text = mode.title;
    self.descLab.text = mode.desc;
}

@end
