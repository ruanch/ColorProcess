//
//  ColorLineView.m
//  DDXR
//
//  Created by NightElf on 2017/7/13.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import "ColorLineProcessView.h"

@interface ColorLineProcessView()
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@end

@implementation ColorLineProcessView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initType
{
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5;

    [self.lineArray enumerateObjectsUsingBlock:^(NSDictionary  *obj,NSUInteger idx, BOOL *_Nonnull stop) {
        //创建出CAShapeLayer
        self.shapeLayer = [CAShapeLayer layer];
 
        //添加并显示
        [self.layer addSublayer:self.shapeLayer];
       
        if(_isAnimal){
            //添加直线动画
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1.0;
            pathAnimation.fromValue = @(0);
            pathAnimation.toValue = @(1);
            pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            [self.shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        }
        float w = self.bounds.size.width/_lineArray.count;
        // 1. 初始化 (UIBezierPath) 路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        // 2. 添加起点 moveToPoint:(CGPoint)
        [path moveToPoint:CGPointMake(idx*w, self.frame.size.height/2)];
        // 3. 添加经过点 addLineToPoint:(CGPoint)
        [path addLineToPoint:CGPointMake((idx+1)*w, self.frame.size.height/2)];
        // 如果线要构成闭合图形
        // path.lineCapStyle=kCGLineCapRound;
        [path closePath];  // 也可以调用-addLineToPoint:方法来添加,添加一个与起点相同的点达到闭合效果
        
        
        self.shapeLayer.path = path.CGPath;
        self.shapeLayer.strokeColor = [obj[@"strokeColor"]CGColor];
        self.shapeLayer.lineWidth =self.frame.size.height;
        
    }];
}

- (void)setLineArray:(NSArray *)lineArray
{
    _lineArray = lineArray;
    [self initType];
    
}

@end
