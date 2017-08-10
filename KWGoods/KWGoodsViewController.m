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
    self.tableView = [[UITableView alloc] initWithFrame:self.tableView.frame style:UITableViewStyleGrouped];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    KWGoodsGroup *goodsGroup = self.goodGroup[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:goodsGroup.image];
    cell.textLabel.text = goodsGroup.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@$",goodsGroup.money];
    
    return cell;
}

@end
