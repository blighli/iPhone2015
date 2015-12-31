//
//  deal Model.h
//  美团
//
//  Created by 陈受恩 on 15/12/14.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface deal_Model : NSObject
//商品分类
@property (nonatomic,copy)NSString *categories;
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *current_price;
@property (nonatomic,copy)NSString *deal_h5_url;
@property (nonatomic,copy)NSString *deal_url;
@property (nonatomic,copy)NSString *Description;
@property (nonatomic,copy)NSString *image_url;
@property (nonatomic,copy)NSString *list_price;
@property (nonatomic,copy)NSString *s_image_url;
@property (nonatomic,copy)NSString *purchase_count;
@property (nonatomic,copy)NSString *title;

-(NSArray*)asignModelWithDict:(NSDictionary*)dict;




//解析网络下载数据
//{
//    businesses =             (
//    );
//    categories =             (
//                              "\U5c55\U89c8/\U6f14\U51fa/\U8d5b\U4e8b",
//                              "\U6f14\U51fa/\U8d5b\U4e8b/\U5c55\U89c8"
//                              );
//    city = "\U5168\U56fd";
//    "commission_ratio" = 0;
//    "current_price" = "19.9";
//    "deal_h5_url" = "http://lite.m.dianping.com/4CPGHfwBF0";
//    "deal_id" = "0-12535198";
//    "deal_url" = "http://dpurl.cn/p/lQDTE1bEuM";
//    description = "\U9f0e\U76db\U4e8c\U4eba\U8f6c\U6b22\U4e50\U5927\U821e\U53f0 \U4ec5\U552e19.9\U5143\Uff0c\U4ef7\U503c30\U5143\U89c2\U5f71\U52381\U5f20\Uff0c\U514d\U8d39wifi\Uff01";
//    distance = "-1";
//    "image_url" = "http://i1.s2.dpfile.com/pc/PXI1TWRxDXdTCxRq-xMhFyoYzn0M9Z9JzqTGE_2WcsPXnC9D2SYEpK4CaULWoBUiBP2cxMxKXhnlNsLtxH5JWg.jpg";
//    "list_price" = 30;
//    "publish_date" = "2015-06-26";
//    "purchase_count" = 2;
//    "purchase_deadline" = "2016-05-12";
//    regions =             (
//    );
//    "s_image_url" = "http://i1.s2.dpfile.com/pc/PXI1TWRxDXdTCxRq-xMhFyoYzn0M9Z9JzqTGE_2WcsNiEFBfYGFdATlTJfWjefpXehXPC7jR0jb2GJ72i5Mfiw.jpg";
//    title = "\U9f0e\U76db\U4e8c\U4eba\U8f6c\U6b22\U4e50\U5927\U821e\U53f0";
//},


@end
