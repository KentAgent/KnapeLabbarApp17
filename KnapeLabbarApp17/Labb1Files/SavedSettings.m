//
//  SavedSettings.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "SavedSettings.h"
#import <UIKit/UIKit.h>

@implementation SavedSettings
//labb 1
+ (void)saveColors:(float)red green:(float)green blue:(float)blue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setFloat:red forKey:@"redColor"];
    [defaults setFloat:green forKey:@"greenColor"];
    [defaults setFloat:blue forKey:@"blueColor"];
    [defaults synchronize];
}
//Labb 1
+ (UIColor*) loadColor{
    float r = [[NSUserDefaults standardUserDefaults]floatForKey:@"redColor"];
    float g = [[NSUserDefaults standardUserDefaults]floatForKey:@"greenColor"];
    float b = [[NSUserDefaults standardUserDefaults]floatForKey:@"blueColor"];
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}
@end
