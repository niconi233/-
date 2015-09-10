//
//  HomeViewController.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/7.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "HomeViewController.h"
#import "Common.h"
#import "HomeCell.h"
#import "DataSevice.h"
//#import "DirayModel.h"
#import "HomeModel.h"
static NSString *cellId = @"cellId";

@interface HomeViewController () {
    UITableView *_tableView;
    NSMutableArray *_dirayModelArray;
    NSMutableArray *_foodModelArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavItem];
    
    [self _loadData];
    
    [self _createTableView];
    [self _createHeaderView];
     

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)_createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_tableView];
    
    UINib *nib = [UINib nibWithNibName:@"HomeCell" bundle:[NSBundle mainBundle]];
    [_tableView registerNib:nib forCellReuseIdentifier:cellId];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (void)_createHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/4)];
    headerView.backgroundColor= [UIColor redColor];
    
    _tableView.tableHeaderView = headerView;
    
}

#pragma mark - tabelViewDatagate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kScreenHeight/4;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row==0) {
        cell.titleLabel.text = @"游记";
        cell.moreButton.tag = 1;
        cell.tag = 1;
        cell.dataArray = _dirayModelArray;
        
       [cell.moreButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (indexPath.row==1) {
        cell.titleLabel.text = @"美食";
        cell.moreButton.tag = 2;
        cell.dataArray = _foodModelArray;
        [cell.moreButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }else if (indexPath.row==2) {
        cell.titleLabel.text = @"景点";
        cell.moreButton.tag = 3;
        [cell.moreButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

        
    }

    
    return cell;
}

- (void)buttonAction:(UIButton*)btn {
    NSLog(@"调转");
}

- (void)_loadData {
    
    [DataSevice request:travellistUrl withHttpArg:travlelistArg block:^(id result) {
        
        NSLog(@"%@",result);
        
        _dirayModelArray = [[NSMutableArray alloc] init];
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        NSArray *books = [dataDic objectForKey:@"books"];
        
        for (NSDictionary *dic in books) {
            HomeModel *model = [[HomeModel alloc] init];
            model.imgUrl = [dic objectForKey:@"headImage"];
            [_dirayModelArray addObject:model];
        }
        
        [_tableView reloadData];
        
    }];
    

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@121.538123 forKey:@"lng"];
    [params setObject:@31.677132 forKey:@"lat"];
    [params setObject:@1 forKey:@"page"];
    
    [DataSevice requestAFUrl:foodListUrl httpMethod:@"GET" params:params data:nil block:^(id result) {
        NSLog(@"%@",result);
        
        _foodModelArray = [[NSMutableArray alloc] init];
        
        NSArray *datas = [result objectForKey:@"result"];
        
        for (NSDictionary *dic in datas) {
            HomeModel *model = [[HomeModel alloc] init];
            model.imgUrl = [dic objectForKey:@"photos"];
            [_foodModelArray addObject:model];
            
        }
        
        [_tableView reloadData];
        
        
    }];
}





@end
