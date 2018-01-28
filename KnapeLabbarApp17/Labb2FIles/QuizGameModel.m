//
//  QuizGameModel.m
//  KnapeLabbarApp17
//
//  Created by Kristoffer Knape on 2018-01-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "QuizGameModel.h"
#import <UIKit/UIKit.h>

@implementation QuizGameModel

-(void)setQuestions{
    //Loads Questions.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    //Loads the array Questions
    NSDictionary *tempDict =[[NSDictionary alloc] initWithContentsOfFile:path];
    self.questionList = [tempDict objectForKey:@"Questions"];
    NSNumber * randomNumber = [NSNumber numberWithInt:(arc4random_uniform((int)self.questionList.count))];
   
    BOOL newQuestion = NO;
    for (int i = 0; i < self.noShowPastQuestions.count; i++) {
        if (randomNumber.intValue != [self.noShowPastQuestions[i] intValue]) {
            newQuestion = YES;
        } else{
            newQuestion = NO;
            break;
        }
    }
    if (newQuestion) {
        self.randomQuestion = [self.questionList objectAtIndex:randomNumber.intValue];
        self.noShowPastQuestions[self.amountOfQuestions-1] = randomNumber;
    } else {
        [self setQuestions];
    }
    
}
-(NSString*)getQuestionLabel{
    return [self.randomQuestion objectForKey:@"questionText"];
}

-(NSString*)getAnswerLabel{
    return [self.randomQuestion objectForKey:@"correctAnswer"];
}
-(NSString*)getAnswer1{
   return [self.randomQuestion objectForKey:@"a1"];
}
-(NSString*)getAnswer2{
    return [self.randomQuestion objectForKey:@"a2"];
}
-(NSString*)getAnswer3{
    return [self.randomQuestion objectForKey:@"a3"];
}
-(NSString*)getAnswer4{
    return [self.randomQuestion objectForKey:@"a4"];
}

-(void)resetQuestionNumbers{
    self.amountOfQuestions = 5;
    self.amountCorrectAnswers = 0;
    self.amountIncorrectAnwers = 0;
    self.noShowPastQuestions = [NSMutableArray arrayWithObjects:@50, @50, @50 ,@50, @50, nil];
}

-(BOOL)playAmountOfQuestions{
    return self.amountOfQuestions;
}

-(void)correctAnswer{
    self.amountCorrectAnswers++;
}
-(void)incorrectAnswer{
    self.amountIncorrectAnwers++;
}

-(NSString*)textForCorrect{
    switch (self.amountCorrectAnswers) {
        case 1:
            return @"Daamn, you got all the right answers";
            break;
        case 2:
            return @"OOOh, soo close, maybe next time";
            break;
        case 3:
            return @"I know you can increase your score";
            break;
        case 4:
            return @"I think a four year old kid can do better than that";
            break;
        case 5:
            return @"This is just embarrassing";
            break;
        default:
            return @"Just leave, and never return";
            break;
    }
}
-(UIColor*)buttonDownColor{
    return [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:0.5f];
}
-(UIColor*)buttonUpColor{
    return [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:1.0f];
}
-(UIColor*)buttonOutColor{
    return [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:1.0f];
}


@end
