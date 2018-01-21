//
//  SettingsViewController.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "SettingsViewController.h"
#import "SavedSettings.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundRed;
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundGreen;
@property (weak, nonatomic) IBOutlet UISwitch *switchBackgroundBlue;
@property (weak, nonatomic) IBOutlet UILabel *saveLabel;

@property (weak, nonatomic) IBOutlet UILabel *fontText;
@property (weak, nonatomic) IBOutlet UISlider *fontSlider;

@property float backgroundRedAmount;
@property float backgroundGreenAmount;
@property float backgroundBlueAmount;


@end

//Fråga erik om global save settings

@implementation SettingsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    //_settings = [[Settings alloc] init];
    // Do any additional setup after loading the view.
    //[self refresh];
    //[self setBackgroundColor];
    self.saveLabel.text=@"";
    [self getSavedColors];
    [self setSwitches];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadColor];
}

-(void)getSavedColors{
    self.backgroundRedAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"redColor"];
    self.backgroundGreenAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"greenColor"];
    self.backgroundBlueAmount = [[NSUserDefaults standardUserDefaults] floatForKey:@"blueColor"];
}

-(void)setSwitches{
    if (self.backgroundRedAmount < 0.5f) {
        [self.switchBackgroundRed setOn:NO animated:NO];
    }
    if (self.backgroundGreenAmount < 0.5f) {
        [self.switchBackgroundGreen setOn:NO animated:NO];
    }
    if (self.backgroundBlueAmount < 0.5f) {
        [self.switchBackgroundBlue setOn:NO animated:NO];
    }
}


// Refresh color for background and text when switch is flipped
- (IBAction)switchChanged:(id)sender {
    [self changeBackgroundColor];
    [self setBackgroundColor];
    self.saveLabel.text=@"";
}

//Save and set backgroundcolor to keys
- (IBAction)saveBackgroundColor:(id)sender {
    [SavedSettings saveColors:self.backgroundRedAmount green:self.backgroundGreenAmount blue:self.backgroundBlueAmount];
    self.backgroundRedAmount = [[NSUserDefaults standardUserDefaults]floatForKey:@"redColor"];
    self.backgroundGreenAmount = [[NSUserDefaults standardUserDefaults]floatForKey:@"greenColor"];
    self.backgroundBlueAmount = [[NSUserDefaults standardUserDefaults]floatForKey:@"blueColor"];
    self.saveLabel.text=@"Saved settings";
}

//Change new backgroundcolor with swithces
- (void)changeBackgroundColor{
    if (self.switchBackgroundRed.isOn) {
        self.backgroundRedAmount = 0.6f;
    } else {
        self.backgroundRedAmount = 0;
    }
    if (self.switchBackgroundGreen.isOn){
        self.backgroundGreenAmount = 0.6f;
    } else {
        self.backgroundGreenAmount = 0;
    }
    if (self.switchBackgroundBlue.isOn){
        self.backgroundBlueAmount = 0.6f;
    } else {
        self.backgroundBlueAmount = 0;
    }
    if (!self.switchBackgroundRed.isOn &&
        !self.switchBackgroundGreen.isOn &&
        !self.switchBackgroundBlue.isOn) {
        self.backgroundRedAmount = 0.3f;
        self.backgroundGreenAmount = 0.3f;
        self.backgroundBlueAmount = 0.3f;
    }
}

//set new backgroundcolor with swithces
- (void)setBackgroundColor{
    self.view.backgroundColor = [UIColor colorWithRed:self.backgroundRedAmount green:self.backgroundGreenAmount blue:self.backgroundBlueAmount alpha:1.0f];
}

// Controls wich difficulty label should show and returns it
- (NSString*)setFontText{
    if (self.fontSlider.value >= 0 &&
        self.fontSlider.value < 0.5) {
        self.fontSlider.value = 0;
        return @"Easy";
    } else if (self.fontSlider.value >= 0.5 &&
               self.fontSlider.value < 1.5){
        self.fontSlider.value = 1;
        return @"Normal";
    } else {
        self.fontSlider.value = 2;
        return @"Hard";
    }
}

//Refreshes teh label showing the difficulty
- (IBAction)sliderChanged:(id)sender {
    self.fontText.text = [self setFontText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
