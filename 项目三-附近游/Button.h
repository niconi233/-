//
//  Button.h
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/9.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Button : UIControl {
    UIImageView *_imageView ;
    UILabel *_label;
}

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title;

@end