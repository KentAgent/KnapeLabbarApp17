//
//  ChooseGAmeViewController.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-20.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "ChooseGameViewController.h"
#import "SavedSettings.h"
@interface ChooseGameViewController ()


@end

@implementation ChooseGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Get changed background
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadColor];
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
