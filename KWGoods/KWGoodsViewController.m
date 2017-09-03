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

//0.定义一个重用标识(static在整个运行过程中，只占了一份内存）
static NSString *ID = @"wine";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    //tableView高度
    self.tableView.rowHeight = 88;
    
    //根据ID这个标识注册相对应cell的类型为tableViewCell（只注册一次）（一般使用自定义cell）
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    //每一组的头部尾部高度
//    self.tableView.sectionHeaderHeight = 88;
//    self.tableView.sectionFooterHeight = 88;
    
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
    //直接创建性能很差
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //0.定义一个重用标识(static在整个运行过程中，只占了一份内存）
//    static NSString *ID = @"wine";
    
    
    
    //1.去缓存池里去是否有可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    //2.如果缓存池里没有可循环利用的cell，则创建
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        NSLog(@"cellForRowAtIndexPath--%ld",(long)indexPath.row);
//        /*
//         *每个cell是都一样的设计
//         */
//    }
    
    /*
     *每个cell不一样的设计
     */
    
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

    /*
     *3.设置数据
     */
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

#pragma mark - UITableViewDelegate
/*
    选中某一行cell时就会调用这个方法
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了：%ld",indexPath.row);
}

/*
 *  取消选中某一行时就会调用这个方法
 */
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消选中了：%ld",indexPath.row);
}

/*
 * 返回每一组的头部控件
 */
//-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}


/*
 * 返回每一组的尾部控件
 */
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    
//}

/*
 * 返回每一组的头部高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

/*
 * 返回每一组的尾部高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

/*
 * 返回每一行cell高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 )
    {
        return 100;
    } else {
        return 50;
    }
}
@end
