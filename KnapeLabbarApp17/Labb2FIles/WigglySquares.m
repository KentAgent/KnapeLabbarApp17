//
//  WigglySquares.m
//  HowMuchDoYouKnow
//
//  Created by lösen är 0000 on 2018-01-24.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "WigglySquares.h"

@implementation WigglySquares

//Make animation happen
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(tick) userInfo:nil repeats:YES];    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGMutablePathRef linePath = CGPathCreateMutable();
    
    //Set the time
    double t = [[NSDate date] timeIntervalSince1970];
    
    int padding = 10;
    float waveHeight = 2.5;
    int waveSpeed = 20;
    
    //Top Line
    float x1 = rect.origin.x + padding;
    float y1 = rect.origin.y + padding;
    
    CGPathMoveToPoint(linePath, NULL, x1, y1);
    
    for (float x = x1; x < rect.size.width - padding; x += 1.0f) {
        float formula = sin(x * 0.1 - (t * waveSpeed)) - sin(x * 0.04);
        CGPathAddLineToPoint(linePath, NULL, x, y1 - (formula * waveHeight));
    }
    
    //Right Line
    float x2 = rect.size.width - padding;
    float y2 = y1;
    
    for (float y = y2; y < rect.size.height - padding; y += 1.0f) {
        float formula = sin(y * 0.1 - (t * waveSpeed)) - sin(y * 0.04);
        CGPathAddLineToPoint(linePath, NULL, x2 - (formula * waveHeight), y);
    }
    
    //Bottom Line
    float x3 = x2;
    float y3 = rect.size.height - padding;
    
    for (float x = x3; x > rect.origin.x + padding; x -= 1.0f) {
        float formula = sin(x * 0.1 + (t * waveSpeed)) + sin(x * 0.04);
        CGPathAddLineToPoint(linePath, NULL, x, y3 + (formula * waveHeight));
    }
    
    //Left Line
    float x4 = rect.origin.x +padding;
    float y4 = y3;
    
    for (float y = y4; y > rect.origin.y + padding; y -= 1.0f) {
        float formula = sin(y * 0.1 + (t * waveSpeed)) + sin(y * 0.04);
        CGPathAddLineToPoint(linePath, NULL, x4 + (formula * waveHeight), y);
    }
    UIBezierPath *path2 = [UIBezierPath bezierPathWithCGPath:linePath];
    
    //Set color
    [[UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:1.0f] setFill];
    [path2 fill];
    
    CGPathRelease(linePath);
}

-(void)tick{
    [self setNeedsDisplay];
}


@end
