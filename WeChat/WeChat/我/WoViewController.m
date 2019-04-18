//
//  WoViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/12.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "WoViewController.h"
#import "WeiXin_TableViewController.h"
#import "Masonry.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
@interface WoViewController ()

@end

@implementation WoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    self.navigationItem.title=@"我";
    self.navigationController.navigationBar.barTintColor=[UIColor grayColor];
    self.navigationController.navigationBar.translucent=YES;
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    UIView *viewWode=[[UIView alloc]init];
//    [self.view addSubview:viewWode];
//   // UIEdgeInsets padding = UIEdgeInsetsMake(100, 100, 100, 100);
//    [viewWode mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.size.mas_equalTo(CGSizeMake(100, 100));
//       // make.top.left.right.bottom.mas_equalTo(self.view).insets(padding);
////        make.edges.mas_equalTo(self.view);
//        make.top.mas_equalTo(self.view).mas_offset(self.navigationController.navigationBar.frame.size.height);
//    }];
    WeiXin_TableViewController *tableViewCon=[[WeiXin_TableViewController alloc]init] ;
    [self addChildViewController:tableViewCon];
    [self.view addSubview:tableViewCon.view];
   

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
