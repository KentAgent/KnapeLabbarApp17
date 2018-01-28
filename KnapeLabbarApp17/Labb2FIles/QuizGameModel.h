//
//  QuizGameModel.h
//  KnapeLabbarApp17
//
//  Created by Kristoffer Knape on 2018-01-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QuizGameModel : NSObject

@property NSMutableArray *questionList;
@property NSDictionary *randomQuestion;
@property NSMutableArray *questions;
@property NSMutableArray *noShowPastQuestions;
@property int amountOfQuestions;
@property int amountCorrectAnswers;
@property int amountIncorrectAnwers;

-(void)setQuestions;
-(void)resetQuestionNumbers;
-(void)incorrectAnswer;
-(void)correctAnswer;
-(BOOL)playAmountOfQuestions;
-(NSString*)textAmountQLeft;
-(NSString*)textForCorrect;
-(NSString*)getQuestionLabel;
-(NSString*)getAnswerLabel;
-(NSString*)getAnswer1;
-(NSString*)getAnswer2;
-(NSString*)getAnswer3;
-(NSString*)getAnswer4;
-(UIColor*)buttonUpColor;
-(UIColor*)buttonDownColor;
-(UIColor*)buttonOutColor;



@end
