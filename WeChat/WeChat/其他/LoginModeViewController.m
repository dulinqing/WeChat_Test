//
//  LoginModeViewController.m
//  WeChat
//
//  Created by du-lq on 2018/11/7.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import "LoginModeViewController.h"
#import "Masonry.h"
#import "RegisterViewController.h"
#import "MytabbarViewController.h"
#import "DataManager.h"

@interface LoginModeViewController ()

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong ) UILabel *labelUserName;
@property(nonatomic)UILabel *labelPassword;
@property(nonatomic) UITextField *textFiledUser;
@property(nonatomic) UITextField *textFiledPassword;
@end

@implementation LoginModeViewController
-(void)viewDidAppear:(BOOL)animated{
   
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"登錄";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = UICOLOR_HEX(0xF05B72);
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissVC)];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor=UICOLOR_HEX(0xF05B72);
    UIImage *image=[UIImage imageNamed:@"test.jpg"];
    self.imageView=[[UIImageView alloc]init];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, image.size.width*0.5, image.size.height*0.5, image.size.width*0.5, 0, M_PI*2, 1);
    CGContextClip(ctx);
    [image drawAtPoint:CGPointZero];
    image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image=image;
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView:)];
    [self.imageView addGestureRecognizer:tapGesture];
    self.imageView.translatesAutoresizingMaskIntoConstraints=NO;
  //约束上边距
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:50]];
    [self.imageView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    [self.imageView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    //约束横向居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
//    NSLog(@"ls--------------------kd=%d",self.imageView.hasAmbiguousLayout);
    [self addLabel];
}
-(void)dismissVC{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void)tapImageView:(UITapGestureRecognizer *)gestureRecognizer{
    [self shakeimageView2];
    [self.imageView setNeedsLayout];
}
#pragma addLabel
-(void)addLabel{
    self.labelUserName=[[UILabel alloc]init];
    self.labelUserName.text=@"用户名:";
    self.labelUserName.textColor=[UIColor whiteColor];
//    self.labelUserName.backgroundColor=[UIColor redColor];
    self.labelUserName.font=[UIFont fontWithName:@"Arial" size:25];
    self.labelUserName.textAlignment=NSTextAlignmentCenter;
    
    self.labelPassword=[[UILabel alloc]init];
    self.labelPassword.text=@"密    码:";
    self.labelPassword.textColor=[UIColor whiteColor];
    self.labelPassword.font=[UIFont fontWithName:@"Arial" size:25];
    self.labelPassword.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.labelPassword];
    [self.view addSubview: self.labelUserName];
    [self.labelUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
        
    }];
    [self.labelPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).mas_offset(20);
        make.top.mas_equalTo(self.labelUserName.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
        
    }];
    //textFiledUser
    self.textFiledUser=[[UITextField alloc]init];
    [self.view addSubview:self.textFiledUser];
    [self.textFiledUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labelUserName.mas_right).mas_offset(4);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-20);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
    }];
    self.textFiledUser.placeholder=@"请输入用户名";
    self.textFiledUser.tintColor=[UIColor redColor];
    self.textFiledUser.adjustsFontSizeToFitWidth=YES;
    self.textFiledUser.borderStyle=UITextBorderStyleNone;
    self.textFiledUser.returnKeyType=UIReturnKeyDone;
    self.textFiledUser.font=[UIFont systemFontOfSize:20];
    self.textFiledUser.clearsOnBeginEditing=YES;
    //textFiledPassword
    self.textFiledPassword=[[UITextField alloc]init];
    [self.view addSubview:self.textFiledPassword];
    [self.textFiledPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labelPassword.mas_right).mas_offset(4);
        make.right.mas_equalTo(self.view.mas_right).mas_offset(-20);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(self.textFiledUser.mas_bottom).mas_offset(20);
    }];
    self.textFiledPassword.placeholder=@"请输入密码";
    self.textFiledPassword.tintColor=[UIColor redColor];
    self.textFiledPassword.adjustsFontSizeToFitWidth=YES;
    self.textFiledPassword.borderStyle=UITextBorderStyleNone;
    self.textFiledPassword.returnKeyType=UIReturnKeyDone;
    self.textFiledPassword.secureTextEntry=YES;
    self.textFiledPassword.clearsOnBeginEditing=YES;
    self.textFiledPassword.font=[UIFont systemFontOfSize:20];
    //LoginButton
    UIButton *loginButton=[[UIButton alloc]init];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labelPassword.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.left.mas_equalTo(self.view.mas_left).mas_offset(30);
        make.height.mas_equalTo(60);
    }];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor blueColor];
    loginButton.titleLabel.textColor=[UIColor whiteColor];
    loginButton.layer.cornerRadius=30;
    loginButton.titleLabel.font=[UIFont boldSystemFontOfSize:25];
    [loginButton addTarget:self action:@selector(clickLogin:) forControlEvents:UIControlEventTouchUpInside];
    //forgetLabel
    UILabel *detailLabel;
    for (int i=0; i<3; i++) {
        detailLabel=[[UILabel alloc]init];
        [self.view addSubview:detailLabel];
        switch (i) {
            case 0:
                detailLabel.text=@"忘记密码？";
                detailLabel.textColor=[UIColor blackColor];
                break;
            case 1:
                detailLabel.text=@"立即注册";
                detailLabel.textColor=[UIColor blackColor];
                detailLabel.userInteractionEnabled=YES;
                break;
            case 2:
                detailLabel.text=@"-----------       OR       -----------";
                detailLabel.textColor=[UIColor whiteColor];
                break;
            default:
                break;
        }
        
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i==2) {
                make.top.mas_equalTo(self.labelPassword.mas_bottom).mas_equalTo(130);
                make.height.mas_equalTo(20);
                make.centerX.mas_equalTo(self.view.mas_centerX);
            }else{
            make.top.mas_equalTo(self.labelPassword.mas_bottom).mas_equalTo(100);
            make.height.mas_equalTo(30);
            make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(pow(-1, i+1)*80);
            }
        }];
        if (i==1) {
            UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
            
            [detailLabel addGestureRecognizer:labelTapGestureRecognizer];
            
        }
        
    }
}
-(void)labelTouchUpInside:(UIGestureRecognizer *)gesture{
    RegisterViewController *resignModeVC=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:resignModeVC animated:YES];
    
}
#pragma clickLogin
-(void)clickLogin:(UIButton *)button{
    [self shakeButton:button];
    [NSThread sleepForTimeInterval:0.1];
    NSString *userName=self.textFiledUser.text;
    NSString *password=self.textFiledPassword.text;
    if ([userName isEqualToString: @""] || [password isEqualToString: @""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"用户名或密码不能为空" message:@"dear:两个一定不能为空哦！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了按钮1，进入按钮1的事件");

        }];
        [alert addAction:action1];
        [self presentViewController:alert animated:YES completion:nil];
        [self shakeimageView];
    }else{
        DataManager *manager=[[DataManager alloc]init];
        NSMutableArray *arrayData= [manager searchData];
        BOOL flag=NO;
        NSString *userName=self.textFiledUser.text;
        NSString *passWord=self.textFiledPassword.text;
        for (NSMutableDictionary *dic in arrayData) {
            if(userName== [dic objectForKey:@"username"]&&passWord==[dic objectForKey:@"password"]){
                flag=YES;
                break;
            }
        }
        if (flag) {
            MytabbarViewController *tabbar=[[MytabbarViewController alloc]init];
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            
            [UIApplication sharedApplication].delegate.window.rootViewController=tabbar;
            [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"logined"];
        }
    }
}
#pragma shakeButton:
-(void)shakeButton:(UIButton *)button{
    CAAnimationGroup *animationGroup=[CAAnimationGroup animation];
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 0.2;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimation.toValue=(__bridge id _Nullable)([UIColor grayColor].CGColor);
    NSArray *animationArray=[NSArray arrayWithObjects:animation,basicAnimation, nil];
    animationGroup.animations=animationArray;
    animationGroup.duration=0.1;
    animationGroup.removedOnCompletion=NO;
    animationGroup.fillMode=kCAFillModeBackwards;
    [button.layer addAnimation:animationGroup forKey:@"animationGroup"];
//    [button.layer addAnimation:animation forKey:@"animationTag"];
}
#pragma shakeimageView2
-(void)shakeimageView2{
    
    CABasicAnimation *animation = [CABasicAnimation new];
      // 设置动画要改变的属性
      animation.keyPath = @"transform.rotation.z";
      //animation.fromValue = @(_bgImgV.layer.transform.m11);
      // 动画的最终属性的值（转7.5圈）
      animation.toValue = @(M_PI*2*5);
      // 动画的播放时间
      animation.duration = 3;
      // 动画效果慢进慢出
      animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
      // 解决动画结束后回到原始状态的问题
      animation.removedOnCompletion = NO;
      animation.fillMode = kCAFillModeForwards;
      // 将动画添加到视图bgImgV的layer上
      [self.imageView.layer addAnimation:animation forKey:@"rotation"];
}
#pragma shakeimageView
-(void)shakeimageView{
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //layer最初的position值
    float position_x = self.imageView.layer.position.x;
    float position_y = self.imageView.layer.position.y;
    //layer向左晃动的偏移量
    NSValue *leftValue = [NSValue valueWithCGPoint:CGPointMake(position_x - 30, position_y)];
    //layer的原始位置
    NSValue *originValue = [NSValue valueWithCGPoint:CGPointMake(position_x, position_y)];
    //layer向右晃动的偏移量
    NSValue *right = [NSValue valueWithCGPoint:CGPointMake(position_x + 30, position_y)];
    //添加每一帧的Value值
    [animation setValues:@[originValue,leftValue,originValue,right,originValue]];
    animation.repeatCount = 10;
    animation.repeatDuration = 1;
    animation.beginTime=CACurrentMediaTime();
    //为layer层添加动画
    [self.imageView.layer addAnimation:animation forKey:@"aaa"];
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
