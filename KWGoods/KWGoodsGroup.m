//
//  KWGoodsGroup.m
//  KWGoods
//
//  Created by korwin on 2017/8/11.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import "KWGoodsGroup.h"

@implementation KWGoodsGroup

+ (instancetype) goodsWithDict:(NSDictionary *)dict
{
    KWGoodsGroup *group = [[KWGoodsGroup alloc] init];
    group.image = dict[@"image"];
    group.money = dict[@"money"];
    group.name = dict[@"name"];
    return group;
}

@end
