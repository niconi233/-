//
//  HomeCollectionViewCell.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/8.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeCollectionViewCell

- (void)setModel:(HomeModel *)model {
    _model = model;
    [self setNeedsLayout];
}
- (void)layoutSubviews {
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [imgView sd_setImageWithURL:[NSURL URLWithString:_model.imgUrl]];
    
    [self.contentView addSubview:imgView];
    
}

@end
