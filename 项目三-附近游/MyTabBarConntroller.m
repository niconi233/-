//
//  MyTabBarConntroller.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/7.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "MyTabBarConntroller.h"
#import "BaseNavController.h"
#import "Common.h"
#import "Button.h"
#import "UIViewExt.h"

@interface MyTabBarConntroller (){
    
    UIImageView *_selectImageView;
    UIImageView *_tabBarView;

    
}


@end

@implementation MyTabBarConntroller

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubVc];
    [self _setTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//创建子控制器

- (void)_createSubVc {
    NSArray *storyboardNames = @[@"Home",@"Diray",@"Food",@"Scenic"];
    
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<storyboardNames.count; i++) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardNames[i] bundle:nil];
        BaseNavController *navigation = [storyboard instantiateInitialViewController];
        
        [navArray addObject:navigation];
    }
    self.viewControllers = navArray;
    
    
}

- (void)_setTabBar {
    
    //把原tabBar按钮移除
    for (UIView *view in self.tabBar.subviews) {
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
        
    }
    
    _tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 49)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbarBG"]];
    
    //imageView的交互打开
    _tabBarView.userInteractionEnabled = YES;
    [self.tabBar addSubview:_tabBarView];
    
    
    _selectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 64, 49)];
    _selectImageView.image = [UIImage imageNamed:@"选中"];
    [self.tabBar addSubview:_selectImageView];
    
    CGFloat itemWidth = kScreenWidth/4;
    CGFloat itemHeight = self.tabBar.height;
    
    NSArray *nameArray = @[@"主页",@"游记",@"美食", @"景点"];

    NSArray *imgNames = @[@"Home.png",
                          @"Diray.png",
                          @"Food.png",
                          @"Scenic",
                          ];
    
    for (int i = 0; i<imgNames.count; i++) {
        
        Button *button = [[Button alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth,itemHeight)
                                         withImageName:imgNames[i]
                                             withTitle:nameArray[i]
                          ];
        //[button setImage:[UIImage imageNamed:imgNames[i]] forState:UIControlStateNormal];
        button.tag = i;
        
        [button addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
    }
    
}

- (void)selectTab:(UIButton*)button {
    [UIView animateWithDuration:0.2 animations:^{
        _selectImageView.center = button.center;
    }];
    self.selectedIndex = button.tag;

}
@end
