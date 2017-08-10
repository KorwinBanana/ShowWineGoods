//
//  KWGoodsGroup.h
//  KWGoods
//
//  Created by korwin on 2017/8/11.
//  Copyright © 2017年 korwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWGoodsGroup : NSObject

@property (nonatomic,strong) NSString  *image;

@property (nonatomic,strong) NSString  *money;

@property (nonatomic,strong) NSString  *name;

+ (instancetype) goodsWithDict:(NSDictionary *)dict;

@end
