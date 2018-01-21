//
//  HemViewController.m
//  Labb1-AppAboutYourSelf
//
//  Created by Kristoffer Knape on 2018-01-18.
//  Copyright © 2018 Kristoffer Knape. All rights reserved.
//

#import "HemViewController.h"
#import "SavedSettings.h"

@interface HemViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageVIew;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UIView *parentView;


@end

@implementation HemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rotateProfilePicture];
    [self profilePicture];
    [self topPicture];
    [self subView];
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor = [SavedSettings loadColor];
}

-(void)subView{
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.profileImageView.frame.size.width, self.profileImageView.frame.size.height)];
}

//Shapechanger for topPicture
-(void)topPicture{
    self.topImageVIew.layer.shadowOffset = CGSizeMake(0,10);
    self.topImageVIew.layer.shadowOpacity = 0.6;
    self.topImageVIew.layer.shadowRadius = 5.0;
}

//Shapechanger for profilepicture
-(void)profilePicture {
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    
    self.containerView.layer.shadowOffset = CGSizeMake(0,10);
    self.containerView.layer.shadowOpacity = 0.6;
    self.containerView.layer.shadowRadius = 5.0;
    self.containerView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds cornerRadius:100.0].CGPath;

}

//Methods to make profile scrollable
-(void)rotateProfilePicture{
    // create and configure the rotation gesture
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureDetected:)];
    [rotationGestureRecognizer setDelegate:self];
    [self.profileImageView addGestureRecognizer:rotationGestureRecognizer];
    
    [self.view addSubview:self.profileImageView];// add the image view as a subview of the view controllers view
}
- (void)rotationGestureDetected:(UIRotationGestureRecognizer *)recognizer
{
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat rotation = [recognizer rotation];
        [recognizer.view setTransform:CGAffineTransformRotate(recognizer.view.transform, rotation)];
        [recognizer setRotation:0];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
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
