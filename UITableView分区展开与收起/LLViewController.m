/*!
 @header LLViewController.m
 
 @abstract 作者Github地址: https://github.com/candiceyrx
 
 @author Created by Candice on 16/8/17
 
 @version 1.00 16/8/17 Creation(版本信息)
 
   Copyright © 2016年 刘灵. All rights reserved.
 */

#import "LLViewController.h"
#import "LLHeaderView.h"
#import "LLSectionModel.h"

@interface LLViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *sectionDataSources;

@end

@implementation LLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"UITableView分区展开与收起";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    [self.tableView registerClass:[LLHeaderView class] forHeaderFooterViewReuseIdentifier:@"HEADER"];
    // Do any additional setup after loading the view.
}

#pragma mark - Getter

#pragma mark -- 初始化数据源
- (NSMutableArray *)sectionDataSources {
    if (_sectionDataSources == nil) {
        _sectionDataSources = [[NSMutableArray alloc]init];
        
        for (NSUInteger i = 0; i < 20; i++) {
            LLSectionModel *sectionModel = [[LLSectionModel alloc]init];
            sectionModel.isExpanded = NO;
            sectionModel.sectionTitle = [NSString stringWithFormat:@"%ld",i];
            NSMutableArray *itemArray = [[NSMutableArray alloc]init];
            for (NSUInteger j = 0; j <10; j ++) {
                LLCellModel *cellModel = [[LLCellModel alloc]init];
                cellModel.title = [NSString stringWithFormat:@"刘灵:section=%ld, row=%ld",i , j];
                [itemArray addObject:cellModel];
            }
            sectionModel.cellModels = itemArray;
            [_sectionDataSources addObject:sectionModel];
        }
    }
    
    return _sectionDataSources;
}

/*
 对于我们这里，分区就是对应的数据源数组的元素的个数，而每个section的行数需要判断是展开还是收起。当是展开状态是，就是cellModels数组的元素个数，否则就是0.
 */

#pragma mark - Delegate

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionDataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LLSectionModel *sectionModel = self.sectionDataSources[section];
    return sectionModel.isExpanded ? sectionModel.cellModels.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    LLSectionModel *sectionModel = self.sectionDataSources[indexPath.section];
    LLCellModel *cellModel = sectionModel.cellModels[indexPath.row];
    cell.textLabel.text = cellModel.title;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LLHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HEADER"];
    
    LLSectionModel *sectionModel = self.sectionDataSources[section];
    view.model = sectionModel;
    view.expandCallback = ^(BOOL isExpanded){
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    };
    
    return view;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
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
