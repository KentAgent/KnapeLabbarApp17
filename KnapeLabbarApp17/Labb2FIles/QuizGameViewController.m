//
//  QuizGameViewController.m
//  QuizzGame2
//
//  Created by Kristoffer Knape on 2018-01-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "QuizGameViewController.h"

@interface QuizGameViewController ()
@property NSMutableArray *questions;
@property NSMutableArray *answers;

@end

@implementation QuizGameViewController

- (void) viewDidUnLoad{
    [self setQuestionLabel:nil];
    [self setCorrectOrInctorrectLabel:nil];
    [self setAnswer1Button:nil];
    [self setAnswer2Button:nil];
    [self setAnswer3Button:nil];
    [self setAnswer4Button:nil];
    [self setAnotherQuestionButton:nil];
    [super viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.quizGameModel = [[QuizGameModel alloc] init];
    [self startGame];
}

-(void)startGame{
    [self.quizGameModel resetQuestionNumbers];
    [self generateNewQuestion];
    [self giveTopText];
}

-(void)generateNewQuestion{
    [self giveTopText];
    self.correctOrInctorrectLabel.hidden = YES;
    if (self.quizGameModel.playAmountOfQuestions) {
        [self setTextGenNewQuestion];
    } else {
        [self restoreAfterGame];
    }
}

- (IBAction)playAgain:(id)sender {
    if (self.quizGameModel.playAmountOfQuestions) {
        self.quizGameModel.amountOfQuestions--;
        [self generateNewQuestion];
        [self resetColors];
    }else {
        [self startGame];
        [self resetColors];
        self.answer3Button.hidden = NO;
        self.answer4Button.hidden = NO;
        self.topText.hidden = NO;
    }
}

- (IBAction)answere1Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer1 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        [self.quizGameModel correctAnswer];
    } else {
        [self correct:NO];
        [self.quizGameModel incorrectAnswer];
    }
}
- (IBAction)answere2Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer2 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        [self.quizGameModel correctAnswer];
    } else {
        [self correct:NO];
        [self.quizGameModel incorrectAnswer];
    }
}
- (IBAction)answere3Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer3 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        [self.quizGameModel correctAnswer];
    } else {
        [self correct:NO];
        [self.quizGameModel incorrectAnswer];
    }
}
- (IBAction)answere4Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer4 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        [self.quizGameModel correctAnswer];
    } else {
        [self correct:NO];
        [self.quizGameModel incorrectAnswer];
    }
}

-(void)setTextGenNewQuestion{
    [self.quizGameModel setQuestions];
    self.anotherQuestionButton.enabled = NO;
    [self.anotherQuestionButton setTitle:(@"") forState:UIControlStateNormal];
    [self buttonsEnabled];
    
    [self.questionLabel setText:self.quizGameModel.getQuestionLabel];
    [self.answer1Button setTitle:self.quizGameModel.getAnswer1 forState:UIControlStateNormal];
    [self.answer2Button setTitle:self.quizGameModel.getAnswer2 forState:UIControlStateNormal];
    [self.answer3Button setTitle:self.quizGameModel.getAnswer3 forState:UIControlStateNormal];
    [self.answer4Button setTitle:self.quizGameModel.getAnswer4 forState:UIControlStateNormal];
}

-(void) buttonsEnabled {
    self.answer1Button.enabled = YES;
    self.answer2Button.enabled = YES;
    self.answer3Button.enabled = YES;
    self.answer4Button.enabled = YES;
}

-(void) buttonsDisabled {
    self.answer1Button.enabled = NO;
    self.answer2Button.enabled = NO;
    self.answer3Button.enabled = NO;
    self.answer4Button.enabled = NO;
}

-(void)restoreAfterGame{
    [self buttonsDisabled];
    self.correctOrInctorrectLabel.hidden = YES;
    self.answer3Button.hidden = YES;
    self.answer4Button.hidden = YES;
    [self afterGameTextChange];
}

-(void) correct:(BOOL) correct{
    if (correct) {
        self.correctOrInctorrectLabel.text = @"Correct";
        self.correctOrInctorrectLabel.hidden = NO;
        self.anotherQuestionButton.enabled = YES;
        [self buttonsDisabled];
        [self.anotherQuestionButton setTitle:(@"New Question") forState:UIControlStateNormal];
    } else {
        self.correctOrInctorrectLabel.text = @"Incorrect";
        self.correctOrInctorrectLabel.hidden = NO;
        self.anotherQuestionButton.enabled = YES;
        [self buttonsDisabled];
        [self.anotherQuestionButton setTitle:(@"New Question") forState:UIControlStateNormal];
    }
}

-(void) afterGameTextChange{
    NSString *correctText = [NSString stringWithFormat: @"Correct answers: %d", self.quizGameModel.amountCorrectAnswers];
    NSString *incorrectText = [NSString stringWithFormat:@"Incorrect answers: %d", self.quizGameModel.amountIncorrectAnwers];
    [self.anotherQuestionButton setTitle:(@"Play Again") forState:UIControlStateNormal];
    [self.answer1Button setTitle:(correctText) forState:UIControlStateNormal];
    [self.answer2Button setTitle:(incorrectText) forState:UIControlStateNormal];
    self.questionLabel.text = [self.quizGameModel textForCorrect];
    self.topText.hidden = YES;

}

-(void)giveTopText{
    NSString *setTopText = [NSString stringWithFormat: @"Answer the following %d questions", self.quizGameModel.amountOfQuestions];
    self.topText.text = setTopText;
}

/*
 --------------------------------------------------------------
                        BUTTON ANIMATIONS
 --------------------------------------------------------------

 */

- (IBAction)a1Down:(id)sender {
    self.answer1Button.backgroundColor = [self.quizGameModel buttonDownColor];
}
- (IBAction)a1Out:(id)sender {
    self.answer1Button.backgroundColor = [self.quizGameModel buttonOutColor];
}
- (IBAction)a2Down:(id)sender {
    self.answer2Button.backgroundColor = [self.quizGameModel buttonDownColor];
}
- (IBAction)a2Out:(id)sender {
    self.answer2Button.backgroundColor = [self.quizGameModel buttonOutColor];
}
- (IBAction)a3Down:(id)sender {
    self.answer3Button.backgroundColor = [self.quizGameModel buttonDownColor];
}
- (IBAction)a3Out:(id)sender {
    self.answer3Button.backgroundColor = [self.quizGameModel buttonOutColor];
}
- (IBAction)a4Down:(id)sender {
    self.answer4Button.backgroundColor = [self.quizGameModel buttonDownColor];
}
- (IBAction)a4Out:(id)sender {
    self.answer4Button.backgroundColor = [self.quizGameModel buttonOutColor];
}


- (IBAction)newQDown:(id)sender {
    self.anotherQuestionButton.backgroundColor = [self.quizGameModel buttonDownColor];
}
- (IBAction)newQOut:(id)sender {
    self.anotherQuestionButton.backgroundColor = [self.quizGameModel buttonOutColor];
}

-(void)resetColors{
    self.answer1Button.backgroundColor = [self.quizGameModel buttonUpColor];
    self.answer2Button.backgroundColor = [self.quizGameModel buttonUpColor];
    self.answer3Button.backgroundColor = [self.quizGameModel buttonUpColor];
    self.answer4Button.backgroundColor = [self.quizGameModel buttonUpColor];
    self.anotherQuestionButton.backgroundColor = [self.quizGameModel buttonUpColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
