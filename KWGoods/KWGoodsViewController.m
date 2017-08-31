//
//  KWGoodsViewController.m
//  KWGoods
//
//  Created by korwin on 2017/8/11.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "KWGoodsViewController.h"
#import "KWGoodsGroup.h"

@interface KWGoodsViewController ()

@property (nonatomic,strong) NSArray *goodGroup;

@end

@implementation KWGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    //tableView高度
    self.tableView.rowHeight = 88;
    
    //每一组的头部尾部高度
    self.tableView.sectionHeaderHeight = 88;
    self.tableView.sectionFooterHeight = 88;
    
    //整张表的头部尾部View
//    self.tableView.tableHeaderView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//    self.tableView.tableFooterView =;
    
    //分割线颜色
//    self.tableView.separatorColor = [UIColor clearColor];
    
    //分割线样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSArray *) goodGroup
{
    if(!_goodGroup) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        
        for (NSDictionary *goods in dictArray) {
            KWGoodsGroup *goodsGroup = [KWGoodsGroup goodsWithDict:goods];
            [temp addObject:goodsGroup];
        }
        
        _goodGroup = temp;
    }
    return _goodGroup;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodGroup.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    //设置右边显示的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置右边显示的控件
    cell.accessoryView = [[UISwitch alloc] init];
    //设置选中样式
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //设置cell的背景颜色
//    cell.backgroundColor = [UIColor redColor];
    
    //设置cell的背景View
//    UIView *bg = [[UIView alloc]init];
//    bg.backgroundColor = [UIColor blueColor];
//    cell.backgroundView = bg;
    
    //设置cell的选中背景View
//    UIView *bg = [[UIView alloc]init];
//    bg.backgroundColor = [UIColor blueColor];
//    cell.selectedBackgroundView = bg;

    
    KWGoodsGroup *goodsGroup = self.goodGroup[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:goodsGroup.image];
    cell.textLabel.text = goodsGroup.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@$",goodsGroup.money];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"头部";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"尾部";
}

@end
