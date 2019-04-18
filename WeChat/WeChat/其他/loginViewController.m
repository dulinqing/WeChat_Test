//
//  loginViewController.m
//  WeChat
//
//  Created by du-lq on 2018/11/6.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import "loginViewController.h"
#import "loginView.h"
#import "masonry.h"
#import "LoginModeViewController.h"
#import "RegisterViewController.h"

@interface loginViewController ()
@property(nonatomic,strong) UIButton *loginButton;
@property(nonatomic,strong) UIButton *resignButton;
@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loginView *login=[[loginView alloc]init];
    login.frame=self.view.frame;
    [self.view addSubview:login];
    [self setUI];
//    self.loginButton.showsTouchWhenHighlighted=YES;
    [self clickButton];
//    [self setAnimation];
    
    // Do any additional setup after loading the view.
}
-(void)shakeToShow:(UIButton *)button{
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = 0.5;

    NSMutableArray *values = [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    
    [button.layer addAnimation:animation forKey:@"animationTag"];
    
}
-(void)setUI{
    self.loginButton=[[UIButton alloc]init];
    [self.view addSubview:self.loginButton];
    self.resignButton=[[UIButton alloc]init];
    [self.view addSubview:self.resignButton];
    [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font=[UIFont systemFontOfSize:20];
    self.loginButton.titleLabel.textColor=[UIColor whiteColor];
    self.loginButton.backgroundColor=[UIColor blueColor];
    self.loginButton.layer.cornerRadius=5;
    self.loginButton.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    [self.resignButton setTitle:@"注册" forState:UIControlStateNormal];
    self.resignButton.titleLabel.font=[UIFont systemFontOfSize:20];
    self.resignButton.titleLabel.textColor=[UIColor whiteColor];
    self.resignButton.titleLabel.font=[UIFont boldSystemFontOfSize:20];
    self.resignButton.backgroundColor=[UIColor greenColor];
    self.resignButton.layer.cornerRadius=5;
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-50);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
        make.right.mas_equalTo(self.view.mas_centerX).mas_offset(-20);
        make.height.mas_equalTo(50);
    }];
    [self.resignButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-50);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-20);
        make.left.mas_equalTo(self.view.mas_centerX).mas_offset(20);
        make.height.mas_equalTo(50);
    }];
}
-(void)setAnimation{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"position"];
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y+200)]];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setDuration:0.25];//设置动画时间，单次动画时间
     [animation setFillMode:kCAFillModeBoth];
    [self.loginButton.layer addAnimation:animation forKey:@"baseanimation"];
}
-(void)clickButton{
    [self.loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self.resignButton addTarget:self action:@selector(clickResignButton) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clickLoginButton{
    NSLog(@"clickLoginButton");
    [self shakeToShow:self.loginButton];
    LoginModeViewController *loginModeVC=[[LoginModeViewController alloc]init];
//    self.definesPresentationContext = YES;
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:loginModeVC];
    loginModeVC.view.superview.frame=CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self presentViewController:nav animated:YES completion:nil];
    });
//    [self presentViewController:loginModeVC animated:YES completion:nil];
}
-(void)clickResignButton{
    NSLog(@"clickResignButton");
    [self shakeToShow:self.resignButton];
    RegisterViewController *resignModeVC=[[RegisterViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:resignModeVC];
    [self presentViewController:nav animated:YES completion:nil];
    
    
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
