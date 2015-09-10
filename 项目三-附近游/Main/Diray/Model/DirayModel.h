//
//  DirayModel.h
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/9.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "BaseModel.h"
//"data": {
//    "books": [
//              {
//                  "bookUrl": "http://travel.qunar.com/youji/5719406?from=baidu_apistore",
//                  "title": "带着老婆再去三亚",
//                  "headImage": "http://img1.qunarzz.com/travel/d8/1507/84/67c371f555be8a.jpg",
//                  "userName": "JOJO带你游世界",
//                  "userHeadImg": "http://headshot.user.qunar.com/headshotsById/121069308.png?s",
//                  "startTime": "2014-11-14",
//                  "routeDays": 5,
//                  "bookImgNum": 300,
//                  "viewCount": 66374,
//                  "likeCount": 319,
//                  "commentCount": 58,
//                  "text": "海棠湾>夏日百货>三亚凤凰国际机场>四川小胡子海鲜加工店>三亚海棠湾9号度假酒店>蜈支洲岛>早餐>三亚海棠湾>品味西餐厅>珠江南田温泉>情人桥>大东海>亚龙湾>蜈支洲码头>亚洲风餐厅>泳池烧烤吧>三亚蜈支洲岛珊瑚酒店>槟榔谷>三亚湾椰梦长廊>椰梦长廊>凤凰岛>观日岩>呀诺达雨林景区>三亚湾>三亚湾凤凰岛海上之星度假酒店>第一市场>鹿回头风情园>鹿回头>鹿回头广场>小东海>三亚亚龙湾人间天堂鸟巢度假村>海南官府菜>旺豪超市>天涯海角>椰子鸡>亚龙湾热带天堂森林公园",
//                  "elite": false
//              },
@interface DirayModel : BaseModel

@property (nonatomic,copy)NSString *bookUrl;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *headImage;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *userHeadImg;
@property (nonatomic,copy)NSString *startTime;
@property (nonatomic,copy)NSString *routeDays;

@end
