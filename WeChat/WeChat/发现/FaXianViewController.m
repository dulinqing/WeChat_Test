//
//  FaXianViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/12.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "FaXianViewController.h"

@interface FaXianViewController ()

@end

@implementation FaXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"发现";
    self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    self.navigationController.navigationBar.translucent=NO;
//    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:self];
//    navController.title=@"发现";
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
