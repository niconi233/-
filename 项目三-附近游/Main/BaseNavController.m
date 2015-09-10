//
//  BaseNavController.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/7.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:
                                     [UIColor whiteColor]
                                 };
    
    self.navigationBar.titleTextAttributes= attributes;
    
    self.navigationBar.translucent = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
