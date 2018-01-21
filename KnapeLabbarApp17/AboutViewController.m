//
//  AboutViewController.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-19.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "AboutViewController.h"
#import "SavedSettings.h"

@interface AboutViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *aboutImage;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self picture];
    [self subView];
}

//Get changed background
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadColor];
}
-(void)subView{
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.aboutImage.frame.size.width, self.aboutImage.frame.size.height)];
}


-(void)picture{
    self.aboutImage.layer.cornerRadius = 10;
    self.aboutImage.clipsToBounds = YES;
    
    self.containerView.layer.shadowOffset = CGSizeMake(0,10);
    self.containerView.layer.shadowRadius = 5.0;
    self.containerView.layer.shadowOpacity = 0.6;
    self.containerView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds cornerRadius:10.0].CGPath;
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
