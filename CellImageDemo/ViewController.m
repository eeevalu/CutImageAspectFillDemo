//
//  ViewController.m
//  CellImageDemo
//
//  Created by Eva on 16/2/24.
//  Copyright © 2016年 Eva. All rights reserved.
//
#define WIDTH                           [[UIScreen mainScreen]bounds].size.width
#define HEIGHT                          [[UIScreen mainScreen]bounds].size.height

#import "ViewController.h"
#import "TestTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@1, @1,@1,@1,nil];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 20, WIDTH - 40, HEIGHT- 40) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestTableViewCell *cell = [[TestTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
