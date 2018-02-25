//
//  CanadaCell.h
//  WDProject
//
//  Created by fengweidong on 2018/2/25.
//  Copyright © 2018年 fengweidong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanadaModel.h"

@interface CanadaCell : UITableViewCell
/** imageHref */
@property (nonatomic, weak) UIImageView *imageHref;
/** title */
@property (nonatomic, weak) UILabel *titleLab;
/** description */
@property (nonatomic, weak) UILabel *descLab;


@property (nonatomic, strong) CanadaModel *mode;

@end
