//
//  GameViewController.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "GameViewController.h"
#import "SavedSettings.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *guessLabel;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *guessButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@property (nonatomic) int randomNumber;
@property (nonatomic) int labelNumber;



@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self game];

}

//Instance for new game
-(void)game {
    self.randomNumber = [self getIntRandomNumber];
    self.mySlider.value = 50;
    self.myLabel.text =  [NSString stringWithFormat:@"%d", (int)self.mySlider.value];
    [self.guessLabel setText:[NSString stringWithFormat:@"Guess a number"]];
}

//Get random number for game
-(int) getIntRandomNumber {
    self.randomNumber = arc4random_uniform(100) +1;
    return self.randomNumber;
}

//Get changed background
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadColor];
}

//Slider to change value
- (IBAction)sliderValueChanged:(id *)sender {
    [self.myLabel setText:[NSString stringWithFormat:@"%d", (int)self.mySlider.value]];
}

-(int)getValue{
    return self.mySlider.value;
}
//Button to increase mySlider.value
- (IBAction)plusValue:(id)sender {
    NSString *labelValue = self.myLabel.text;
    NSInteger currentValue = [labelValue integerValue];
    self.labelNumber = (int)currentValue;
    [self.mySlider setValue:self.mySlider.value + 1];
    self.labelNumber++;
    [self.myLabel setText:[NSString stringWithFormat:@"%d", self.labelNumber]];
}

//Button to decrease mySlider.value
- (IBAction)minusValue:(id)sender {
    NSString *labelValue = self.myLabel.text;
    NSInteger currentValue = [labelValue integerValue];
    self.labelNumber = (int)currentValue;
    [self.mySlider setValue:self.mySlider.value - 1];
    self.labelNumber--;
    [self.myLabel setText:[NSString stringWithFormat:@"%d", self.labelNumber]];
}

//Gueessbutton
- (IBAction)guessNumber:(id *)sender {
    if (self.randomNumber > (int)self.mySlider.value) {
        [self.guessLabel setText:[NSString stringWithFormat:@"Guess higher"]];
    } else if (self.randomNumber < (int)self.mySlider.value) {
        [self.guessLabel setText:[NSString stringWithFormat:@"Guess lower"]];
    } else{
        [self.guessLabel setText:[NSString stringWithFormat:@"thats right"]];
    }
}
- (IBAction)resetGame:(id)sender {
    [self game];
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
