//
//  QuizGameViewController.m
//  QuizzGame2
//
//  Created by Kristoffer Knape on 2018-01-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "QuizGameViewController.h"

@interface QuizGameViewController ()

@end

@implementation QuizGameViewController

@synthesize questionLabel;
@synthesize correctOrInctorrectLabel;
@synthesize answere1Button;
@synthesize answere2Button;
@synthesize answere3Button;
@synthesize answere4Button;
@synthesize anotherQuestionButton;

@synthesize questionList = question_;
@synthesize answereList = answere_;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Bla bla bla
    }
    return self;
}

- (void) viewDidUnLoad{
    [self setQuestionLabel:nil];
    [self setCorrectOrInctorrectLabel:nil];
    [self setAnswere1Button:nil];
    [self setAnswere2Button:nil];
    [self setAnswere3Button:nil];
    [self setAnswere4Button:nil];
    [self setAnotherQuestionButton:nil];
    [super viewDidLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setQuestion];
}

-(void)setQuestion{
    //Loads Questions.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    //Loads the array Questions
    NSDictionary *tempDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.questionList = [tempDict objectForKey:@"Questions"];
    
    NSDictionary *newRandomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
    //Set text on labels
    [self.questionLabel setText:[newRandomQuestion objectForKey:@"questionText"]];
    [self.correctOrInctorrectLabel setText:[newRandomQuestion objectForKey:@"correctAnswere"]];
    //Set text on buttons
    [self.answere1Button setTitle:[newRandomQuestion objectForKey:@"a1"] forState:UIControlStateNormal];
    [self.answere2Button setTitle:[newRandomQuestion objectForKey:@"a2"] forState:UIControlStateNormal];
    [self.answere3Button setTitle:[newRandomQuestion objectForKey:@"a3"] forState:UIControlStateNormal];
    [self.answere4Button setTitle:[newRandomQuestion objectForKey:@"a4"] forState:UIControlStateNormal];
    
    
}
- (IBAction)answere1Pressed:(id)sender {
    NSDictionary *newRandomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
    if ([newRandomQuestion objectForKey:@"correctAnswere"] == [newRandomQuestion objectForKey:@"a1"]) {
        self.correctOrInctorrectLabel.text = @"Correct";
    }
    else{
        self.correctOrInctorrectLabel.text = @"Incorrect";
    }
}
- (IBAction)answere2Pressed:(id)sender {
    NSDictionary *newRandomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
    if ([newRandomQuestion objectForKey:@"correctAnswere"] == [newRandomQuestion objectForKey:@"a2"]) {
        self.correctOrInctorrectLabel.text = @"Correct";
    }
    else{
        self.correctOrInctorrectLabel.text = @"Incorrect";
    }
    
}
- (IBAction)answere3Pressed:(id)sender {
    NSDictionary *newRandomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
    if ([newRandomQuestion objectForKey:@"correctAnswere"] == [newRandomQuestion objectForKey:@"a3"]) {
        self.correctOrInctorrectLabel.text = @"Correct";
    }
    else{
        self.correctOrInctorrectLabel.text = @"Incorrect";
    }
}
- (IBAction)answere4Pressed:(id)sender {
    NSDictionary *newRandomQuestion = [self.questionList objectAtIndex:arc4random_uniform((int)self.questionList.count)];
    if ([newRandomQuestion objectForKey:@"correctAnswere"] == [newRandomQuestion objectForKey:@"a4"]) {
        self.correctOrInctorrectLabel.text = @"Correct";
    }
    else{
        self.correctOrInctorrectLabel.text = @"Incorrect";
    }
}



- (IBAction)newQuestion:(id)sender {
    [self setQuestion];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
