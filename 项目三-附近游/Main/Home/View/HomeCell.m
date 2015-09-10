//
//  HomeCell.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/8.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "HomeCell.h"
#import "Common.h"
#import "UIViewExt.h"
#import "HomeCollectionViewCell.h"
#import "HomeModel.h"

static NSString *collectId = @"collectId";
@implementation HomeCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


- (void)_createCollectionView {
    //布局对象，关于colleciton 的布局 统一放到布局对象
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
    
    //每个单元格大小
    layout.itemSize = CGSizeMake((kScreenWidth-50)/4, kScreenHeight/4-30);
    //设置水平滑动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,25,self.contentView.width,self.contentView.height-25) collectionViewLayout:layout];
    
    
    _homeCollectionView.delegate = self;
    _homeCollectionView.dataSource = self;
    
    [self addSubview:_homeCollectionView];
    
    [_homeCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:collectId];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor blueColor];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}

- (void)setDataArray:(NSArray *)dataArray {
    
    _dataArray = dataArray;
    
    [self _createCollectionView];

}

//设置页边空白
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section  {
    
    return UIEdgeInsetsMake(0, 10, 0, 10);

}


@end
