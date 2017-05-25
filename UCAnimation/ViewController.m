//
//  ViewController.m
//  UCAnimation
//
//  Created by 蓝云 on 2017/5/10.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "ViewController.h"
#import "UCView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UCView *_ucView;
    UITableView *_tableView;
    UIView *Headerview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UCView *ucView = [[UCView alloc] initWithFrame:CGRectMake(0, 0, 375, 400)];
    [self.view addSubview:ucView];
    _ucView = ucView;
    [self initTableView];
    
}

- (void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
    [self initTableHeaderView];
}

- (void)initTableHeaderView
{
    Headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    Headerview.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = Headerview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _ucView.progress = scrollView.contentOffset.y;
    if (scrollView.contentOffset.y>0) {
        if (scrollView.contentOffset.y/1000<0.1) {
            Headerview.backgroundColor = [UIColor colorWithWhite:0 alpha:scrollView.contentOffset.y/1000];
        }
        
    } else {
        Headerview.backgroundColor = [UIColor clearColor];
    }
}



@end
