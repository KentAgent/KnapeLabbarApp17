//
//  QuizGameModel.h
//  KnapeLabbarApp17
//
//  Created by Kristoffer Knape on 2018-01-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizGameModel : NSObject

@property NSMutableArray *questionList;
@property NSDictionary *randomQuestion;
@property NSMutableArray *questions;
-(void)setQuestions;
-(NSString*)getQuestionLabel;
-(NSString*)getAnswerLabel;
-(NSString*)getAnswer1;
-(NSString*)getAnswer2;
-(NSString*)getAnswer3;
-(NSString*)getAnswer4;


@end
