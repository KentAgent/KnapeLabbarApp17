//
//  ViewControllerGameSettings.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-15.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "GameSettingsViewController.h"

@interface GameSettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *difficultyText;
@property (weak, nonatomic) IBOutlet UISlider *difficultySlider;

@end

@implementation GameSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refresh];
}

// Refresh label showing difficulty
- (void)refresh{
    self.difficultyText.text = [self setDifficultyText];
}

// Controls wich difficulty label should show and returns it
- (NSString*)setDifficultyText{
    if (self.difficultySlider.value >= 0 &&
        self.difficultySlider.value < 0.5) {
        self.difficultySlider.value = 0;
        return @"Easy";
    } else if (self.difficultySlider.value >= 0.5 &&
               self.difficultySlider.value < 1.5){
        self.difficultySlider.value = 1;
        return @"Normal";
    } else {
        self.difficultySlider.value = 2;
        return @"Hard";
    }
}

//Refreshes teh label showing the difficulty
- (IBAction)sliderChanged:(id)sender {
    [self refresh];
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
