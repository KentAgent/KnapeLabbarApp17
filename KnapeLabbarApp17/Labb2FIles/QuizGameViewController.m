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
@property NSProgress *progress;

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
    self.progressBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self startGame];
    [self generateNewQuestion];
    //instantiate QuizGameModel
}

-(void)startGame{
    amountOfQuestions = -1;
    amountCorrectAnswers = 0;
    amountIncorrectAnwers = 0;
    [self generateNewQuestion];
}

-(void)generateNewQuestion{
    amountOfQuestions++;
    if (amountOfQuestions < 5) {
        [self setTextGenNewQuestion];
    } else {
        [self afterGame];
    }
}

- (IBAction)playAgain:(id)sender {
    if (amountOfQuestions < 5) {
        [self generateNewQuestion];
    }else {
        [self startGame];
        self.answer3Button.hidden = NO;
        self.answer4Button.hidden = NO;
        [self.anotherQuestionButton setTitle:(@"New Question") forState:UIControlStateNormal];
    }
}

- (IBAction)answere1Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer1 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        amountCorrectAnswers++;
    } else {
        [self correct:NO];
        amountIncorrectAnwers++;
    }
}
- (IBAction)answere2Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer2 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        amountCorrectAnswers++;
    } else {
        [self correct:NO];
        amountIncorrectAnwers++;
    }
}
- (IBAction)answere3Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer3 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        amountCorrectAnswers++;
    } else {
        [self correct:NO];
        amountIncorrectAnwers++;
    }
}
- (IBAction)answere4Pressed:(id)sender {
    if ([self.quizGameModel.getAnswer4 isEqualToString:self.quizGameModel.getAnswerLabel]) {
        [self correct:YES];
        amountCorrectAnswers++;
    } else {
        [self correct:NO];
        amountIncorrectAnwers++;
    }
}

-(void)setTextGenNewQuestion{
    self.quizGameModel.setQuestions;
    self.anotherQuestionButton.enabled = NO;
    [self.anotherQuestionButton setTitle:(@"") forState:UIControlStateNormal];
    [self buttonsEnabled];
    
    [self.questionLabel setText:self.quizGameModel.getQuestionLabel];
    //[self.correctOrInctorrectLabel setText:self.quizGameModel.getAnswerLabel];
    [self.answer1Button setTitle:self.quizGameModel.getAnswer1 forState:UIControlStateNormal];
    [self.answer2Button setTitle:self.quizGameModel.getAnswer2 forState:UIControlStateNormal];
    [self.answer3Button setTitle:self.quizGameModel.getAnswer3 forState:UIControlStateNormal];
    [self.answer4Button setTitle:self.quizGameModel.getAnswer4 forState:UIControlStateNormal];
}

-(void) correct:(BOOL) correct{
    if (correct) {
    self.correctOrInctorrectLabel.text = @"Correct";
        [self buttonsDisabled];
        self.anotherQuestionButton.enabled = YES;
        [self.anotherQuestionButton setTitle:(@"New Question") forState:UIControlStateNormal];
    } else {
    self.correctOrInctorrectLabel.text = @"Incorrect";
        [self buttonsDisabled];
        self.anotherQuestionButton.enabled = YES;
        [self.anotherQuestionButton setTitle:(@"New Question") forState:UIControlStateNormal];
    }
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

-(void)afterGame{
    [self buttonsDisabled];
    self.correctOrInctorrectLabel.hidden = YES;
    self.answer3Button.hidden = YES;
    self.answer4Button.hidden = YES;
    [self afterGameTextChange];
}

-(void) afterGameTextChange{
    [self.anotherQuestionButton setTitle:(@"Play Again") forState:UIControlStateNormal];
    NSString *correctText = [NSString stringWithFormat: @"Correct answers: %d", amountCorrectAnswers];
    NSString *incorrectText = [NSString stringWithFormat:@"Incorrect answers: %d", amountIncorrectAnwers];

    [self.answer1Button setTitle:(correctText) forState:UIControlStateNormal];
    [self.answer2Button setTitle:(incorrectText) forState:UIControlStateNormal];
    
    if (amountCorrectAnswers == 5){
        self.questionLabel.text = @"Daamn, you got all the right answers";
    } else if (amountCorrectAnswers == 4){
        self.questionLabel.text = @"OOOh, soo close, maybe next time";
    } else if (amountCorrectAnswers == 3){
        self.questionLabel.text = @"I know you can increase your score";
    } else if (amountCorrectAnswers == 2){
        self.questionLabel.text = @"I think a four year old kid can do better than that";
    } else if (amountCorrectAnswers == 1){
        self.questionLabel.text = @"This is just embarrassing";
    } else{
        self.questionLabel.text =@"Just leave, and never return";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
