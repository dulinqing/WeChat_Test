//
//  RegisterViewController.m
//  WeChat
//
//  Created by GaoFan on 2018/11/8.
//  Copyright © 2018 gf. All rights reserved.
//

#import "RegisterViewController.h"
#import "Masonry.h"
#import "LoginModeViewController.h"
#import "DataManager.h"
#define ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface RegisterViewController ()
{

    NSDictionary *dictionary;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = ColorFromRGB(0xFAF9FF);
    self.navigationController.navigationBar.barTintColor= [UIColor  redColor];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationItem.title=@"註冊";
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *cancelButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelToIndex)];
    self.navigationItem.rightBarButtonItem=cancelButtonItem;
    [self initContentView];
    
}
-(void)cancelToIndex{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void)initContentView{
    UILabel *usernameLb = [[UILabel alloc]init];
    usernameLb.text = @" 用戶名";
    
    [self.view addSubview:usernameLb];
    
    UILabel *passwordLb = [[UILabel alloc]init];
    passwordLb.text = @" 密  碼";
    [self.view addSubview:passwordLb];
    
    UILabel *secPasswordLb = [[UILabel alloc]init];
    secPasswordLb.text = @"確認密碼";
    
    [self.view addSubview:secPasswordLb];
    _name = [[UITextField alloc]init];
    _name.borderStyle = UITextBorderStyleRoundedRect;
//    _name.autocapitalizationType = UITextAutocapitalizationTypeNone;//设置首字母小写
    _name.tintColor = ColorFromRGB(0x4D507B);
    _name.placeholder = @"請輸入用戶名";
        [self.view addSubview:_name];
    
    _password = [[UITextField alloc]init];
    _password.placeholder = @"請輸入密碼";
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.tintColor = ColorFromRGB(0x4D507B);
    _password.secureTextEntry = YES;
    [self.view addSubview:_password];
    
    _secPassword = [[UITextField alloc]init];
    _secPassword.placeholder = @"請確認密碼";
    _secPassword.borderStyle = UITextBorderStyleRoundedRect;
    _secPassword.tintColor = ColorFromRGB(0x4D507B);
    _secPassword.secureTextEntry = YES;
    [self.view addSubview:_secPassword];
    
    _go = [[UIButton alloc]init];
    [_go setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_go setTitle:@"注 冊" forState:UIControlStateNormal];
    _go.layer.cornerRadius = 5.0;
    _go.backgroundColor = ColorFromRGB(0x4D507B);
    [_go addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_go];
    
    
    UIButton *lbregister = [[UIButton alloc] init];
    lbregister.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [lbregister setTitleColor:ColorFromRGB(0x4D507B) forState:UIControlStateNormal];
    [lbregister setTitle:@"已有账号，去登录" forState:UIControlStateNormal];
    lbregister.titleLabel.textAlignment = NSTextAlignmentCenter;
    [lbregister addTarget:self action:@selector(goLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lbregister];
    
    UILabel *lbline = [[UILabel alloc] init];
    lbline.backgroundColor = ColorFromRGB(0x4D507B);
    [self.view addSubview:lbline];
    
    [lbline mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(lbregister.mas_top).offset(-10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(@(250));
        make.height.equalTo(@1);
        
    }];
    
    [lbregister mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-25);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.equalTo(@(160));
        make.height.equalTo(@(20));
        
    }];
    
    [usernameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.centerY.mas_equalTo(self.view.mas_centerY).offset(-180);
        make.width.mas_equalTo(85);
        make.height.mas_equalTo(50);
    }];
    [passwordLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.top.mas_equalTo(usernameLb.mas_bottom).offset(30);
        make.width.height.mas_equalTo(usernameLb);
    }];
    [secPasswordLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordLb.mas_left);
        make.top.mas_equalTo(passwordLb.mas_bottom).offset(30);
        make.width.height.mas_equalTo(usernameLb);
    }];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(usernameLb.mas_right).offset(10);
        make.top.mas_equalTo(usernameLb.mas_top);
        make.width.mas_equalTo(230);
        make.height.mas_equalTo(50);
    }];
   
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.name);
        make.top.mas_equalTo(passwordLb);
        make.width.height.mas_equalTo(self.name);
    }];
    [_secPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.password);
        make.top.mas_equalTo(secPasswordLb);
        make.width.height.mas_equalTo(self.password);
    }];
    [_go mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(secPasswordLb.mas_bottom).offset(50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
}
-(void)submit{
    DataManager *dataManager=[[DataManager alloc]init];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    array=[dataManager searchData];
    BOOL flag=NO;
    for (NSMutableDictionary *dicinner in array) {
       if( [self.name.text isEqualToString:[dicinner objectForKey:@"username"]])
       {
           flag=YES;
           break;
       }
    }
    if (_name.text.length >0 && _secPassword.text.length>0 && _password.text.length >0) {
        if (!flag ) {
            if ([_password.text isEqual:_secPassword.text]) {
                [dic setObject:self.name.text forKey:@"username"];
                [dic setObject:self.password.text forKey:@"password"];
                [array addObject:dic];
                [dataManager saveData:array];
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"溫馨提示" message:@"註冊成功，請登錄" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    [self goLogin];
                }];
                [alertView addAction:defaultAction];
                [self presentViewController:alertView animated:YES completion:nil];
            }
            else{
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"溫馨提示" message:@"兩次密碼不一致" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    [self->_go addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
                    
                }];
                [alertView addAction:defaultAction];
                
                [self presentViewController:alertView animated:YES completion:nil];
            }
            
        }else{
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"溫馨提示" message:@"該用戶名已存在，請重新填寫用戶名" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action) {
                //响应事件
            }];
            [alertView addAction:defaultAction];
            
            [self presentViewController:alertView animated:YES completion:nil];
        }
    }else{
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"溫馨提示" message:@"信息不能為空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
        }];
        [alertView addAction:defaultAction];
        
        [self presentViewController:alertView animated:YES completion:nil];
    }
}
-(void)goLogin{
    LoginModeViewController *loginVC=[[LoginModeViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
