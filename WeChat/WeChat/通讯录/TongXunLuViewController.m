//
//  TongXunLuViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/12.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "TongXunLuViewController.h"

@interface TongXunLuViewController ()

@end

@implementation TongXunLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"通讯录";
    self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemOrganize) target:self action:nil];
    self.navigationItem.rightBarButtonItem=barButtonItem;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
//    self.navigationController.navigationBar.translucent=NO;
//    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:self];
//    navController.title=@"通讯录";
    // Do any additional setup after loading the view.
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
