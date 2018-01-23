//
//  QuizGameViewController.h
//  QuizzGame2
//
//  Created by Kristoffer Knape on 2018-01-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizGameViewController : UIViewController{
    //players current question
    int currentQuestion;
    //amount of correct answeres
    int amountCorrectAnsweres;
}
//Labels
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctOrInctorrectLabel;
//Answere buttons
@property (weak, nonatomic) IBOutlet UIButton *answere1Button;
@property (weak, nonatomic) IBOutlet UIButton *answere2Button;
@property (weak, nonatomic) IBOutlet UIButton *answere3Button;
@property (weak, nonatomic) IBOutlet UIButton *answere4Button;
//New question
@property (weak, nonatomic) IBOutlet UIButton *anotherQuestionButton;

//List of all questions
@property (nonatomic) NSArray *questionList;
//all answeres in questionList
@property (nonatomic) NSString *answereList;

@end
