//
//  QuizGameModel.m
//  KnapeLabbarApp17
//
//  Created by Kristoffer Knape on 2018-01-24.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "QuizGameModel.h"

@implementation QuizGameModel

-(void)setQuestions{
    //Loads Questions.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    //Loads the array Questions
    NSDictionary *tempDict =[[NSDictionary alloc] initWithContentsOfFile:path];
    self.questionList = [tempDict objectForKey:@"Questions"];
    self.randomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
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



@end
