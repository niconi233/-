//
//  HomeCell.h
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/8.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout> {
    UICollectionView *_homeCollectionView;

}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;


@property (nonatomic,strong) NSArray *dataArray;

@end
