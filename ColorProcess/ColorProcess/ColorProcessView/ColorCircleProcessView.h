//
//  ColorLineView.h
//  DDXR
//
//  Created by NightElf on 2017/7/13.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorCircleProcessView : UIView
//数组里面装的是字典，，字典里有两个key -> strokeColor和precent
@property (nonatomic,assign) NSArray *circleArray;
//是否需要动画
@property (nonatomic,assign) BOOL isAnimal;
@end
