//
//  mytebbarViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/12.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "MytabbarViewController.h"
#import "WoViewController.h"
#import "WeixinViewController.h"
#import "TongXunLuViewController.h"
#import "FaXianViewController.h"

@interface MytabbarViewController ()

@end

@implementation MytabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [UITabBar appearance].barTintColor=[UIColor redColor];
    [UITabBar appearance].backgroundColor=[UIColor purpleColor];
    [UITabBar appearance].translucent=NO;
    UITabBar *tabBar=self.tabBar;
    tabBar.tintColor=[UIColor greenColor];
    
    WoViewController *woViewController=[[WoViewController alloc]init];
    woViewController.tabBarItem.title=@"我";
    woViewController.tabBarItem.image=[UIImage imageNamed:@"tab_mine_unselect@3x"];
    UINavigationController *navController1=[[UINavigationController alloc]initWithRootViewController:woViewController];
    navController1.title=@"我";
    
    WeixinViewController *weiXinViewController=[[WeixinViewController alloc]init];
    weiXinViewController.tabBarItem.title=@"微信";
    weiXinViewController.tabBarItem.image=[UIImage imageNamed:@"tab_xiaole_unselect@3x"];
    weiXinViewController.tabBarItem.badgeValue=@"99+";
    UINavigationController *navController2=[[UINavigationController alloc]initWithRootViewController:weiXinViewController];
    //    navController2.title=@"微信";
    
    TongXunLuViewController *tongXunLuViewController=[[TongXunLuViewController alloc]init];
    tongXunLuViewController.tabBarItem.title=@"通讯录";
    tongXunLuViewController.tabBarItem.image=[UIImage imageNamed:@"tab_shop_select @3x"];
    UINavigationController *navController3=[[UINavigationController alloc]initWithRootViewController:tongXunLuViewController];
    navController3.title=@"通讯录";
    
    FaXianViewController *faXianViewController=[[FaXianViewController alloc]init];
    faXianViewController.tabBarItem.title=@"发现";
    faXianViewController.tabBarItem.image=[UIImage imageNamed:@"tab_xiaole_unselect@3x"];
    UINavigationController *navController4=[[UINavigationController alloc]initWithRootViewController:faXianViewController];
    navController4.title=@"发现";
    
    self.viewControllers=@ [navController2,navController3,navController4,navController1];
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
