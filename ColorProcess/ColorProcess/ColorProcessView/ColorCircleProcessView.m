//
//  ColorLineView.m
//  DDXR
//
//  Created by NightElf on 2017/7/13.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import "ColorCircleProcessView.h"

@interface ColorCircleProcessView()
@property (nonatomic,strong) CAShapeLayer *shapeLayer;
@end

@implementation ColorCircleProcessView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initType
{
    __block float a = 0;
    [self.circleArray enumerateObjectsUsingBlock:^(NSDictionary  *obj,NSUInteger idx, BOOL *_Nonnull stop) {
        //创建出CAShapeLayer
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.frame =CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height);//设置shapeLayer的尺寸和位置
        //    self.shapeLayer.position = self.view.center;
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
        //设置线条的宽度和颜色
        self.shapeLayer.lineWidth =10.0f;
        self.shapeLayer.strokeColor = [obj[@"strokeColor"]CGColor];
        //创建出圆形贝塞尔曲线
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height)];
        //让贝塞尔曲线与CAShapeLayer产生联系
        self.shapeLayer.path = circlePath.CGPath;
        self.shapeLayer.strokeStart = a;
        self.shapeLayer.strokeEnd = [obj[@"precent"]floatValue] + a;
        a = self.shapeLayer.strokeEnd;
        //添加并显示
        [self.layer addSublayer:self.shapeLayer];
          if(_isAnimal){
            //添加圆环动画
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1.0;
            pathAnimation.fromValue = @(0);
            pathAnimation.toValue = @(1);
            pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            [self.shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
          }
    }];

}

- (void)setCircleArray:(NSArray *)circleArray
{
    _circleArray = circleArray;
    [self initType];
    
}

@end
