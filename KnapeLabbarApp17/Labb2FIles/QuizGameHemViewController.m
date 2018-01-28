//
//  QuizGameHemViewController.m
//  QuizzGame2
//
//  Created by Kristoffer Knape on 2018-01-23.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "QuizGameHemViewController.h"

@interface QuizGameHemViewController ()

@end

@implementation QuizGameHemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonStartDown:(id)sender {
    self.playQuizButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:0.5f];
}
- (IBAction)buttonStartUp:(id)sender {
    self.playQuizButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:1.0f];
}
- (IBAction)buttonStartDrag:(id)sender {
    self.playQuizButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.675f blue:0.698f alpha:1.0f];

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
