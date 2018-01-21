//
//  SavedSettings.h
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-17.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavedSettings : NSObject
//Labb 1
+ (void)saveColors:(float)red green:(float)green blue:(float)blue;
//Labb 1
+ (UIColor*) loadColor;
@end
