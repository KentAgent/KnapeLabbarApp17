//
//  QuizGameViewController.h
//  QuizzGame2
//
//  Created by Kristoffer Knape on 2018-01-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizGameModel.h"

@interface QuizGameViewController : UIViewController{
    //total amount of played questions
    int amountOfQuestions;
    //amount of correct answeres
    int amountCorrectAnswers;
    //amount of incorrect answeres
    int amountIncorrectAnwers;
}
@property (weak, nonatomic) IBOutlet UILabel *incorrect;
@property (weak, nonatomic) IBOutlet UILabel *amountOfQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *correct;

@property (weak, nonatomic) IBOutlet UILabel *topText;
//Labels
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctOrInctorrectLabel;
//Answere buttons
@property (weak, nonatomic) IBOutlet UIButton *answer1Button;
@property (weak, nonatomic) IBOutlet UIButton *answer2Button;
@property (weak, nonatomic) IBOutlet UIButton *answer3Button;
@property (weak, nonatomic) IBOutlet UIButton *answer4Button;
//New question
@property (weak, nonatomic) IBOutlet UIButton *anotherQuestionButton;

//List of all questions
@property (nonatomic) NSArray *questionList;
//all answeres in questionList
@property (nonatomic) NSString *answereList;
@property (nonatomic) QuizGameModel* quizGameModel;










@end
