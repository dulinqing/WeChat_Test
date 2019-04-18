//
//  WeixinViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/12.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "WeixinViewController.h"
//#import "WeiXin_TableViewController.h"
//#import <AFNetworking.h>
#import "WeiXinTableViewController.h"
#import "PopoverTableViewController.h"

@interface WeixinViewController ()<UIPopoverPresentationControllerDelegate>
@property WeiXinTableViewController *weiXinTableViewCon;
@end

@implementation WeixinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    self.navigationItem.title=@"微信";
    self.navigationController.navigationBar.barTintColor=[UIColor blackColor];
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    UIBarButtonItem *buttonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickButton)];
//    self.modalPresentationStyle=UIModalPresentationPopover;
//    UIPopoverPresentationController *popover=self.popoverPresentationController;
//    popover.sourceView=self.navigationController.navigationBar;
    self.navigationItem.rightBarButtonItem=buttonItem;
    
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    NSString *urlStr=@"http://www.baidu.com";
    NSURLSession *session=[NSURLSession sharedSession];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        }
        else
            NSLog(@"fail");
    }];
    [task resume];
//    [self AFNetworkingManager];
    [self setUI];
    [self.view endEditing:YES];
//    UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:self];
//    navController.title=@"微信";
    // Do any additional setup after loading the view.
}

-(void)setUI{
    
    self.weiXinTableViewCon=[[WeiXinTableViewController alloc]init];
    [self addChildViewController:self.weiXinTableViewCon];
    [self.view addSubview:self.weiXinTableViewCon.view];
   
    

}

//-(void)AFNetworkingManager{
//    AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"unknown wang luo");
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"wu wangluo ");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                NSLog(@"3G/4G");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"WIFI");
//                break;
//            default:
//                break;
//        }
//    }];
//    [manager startMonitoring];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)clickButton{
    NSLog(@"点击了添加按钮");
//    WeiXin_TableViewController *weixin_TableViewController=[[WeiXin_TableViewController alloc]init];
    PopoverTableViewController *popoverCon=[[PopoverTableViewController alloc]init];
    popoverCon.modalPresentationStyle=UIModalPresentationPopover;
    UIPopoverPresentationController *popoverPreCon=popoverCon.popoverPresentationController;
    popoverPreCon.delegate=self;
    popoverPreCon.barButtonItem=self.navigationItem.rightBarButtonItem;
    popoverPreCon.permittedArrowDirections=UIPopoverArrowDirectionAny;
    popoverPreCon.sourceRect=popoverCon.view.bounds;
    popoverPreCon.backgroundColor=[UIColor grayColor];
//    [self.navigationController pushViewController:popoverCon animated:YES];
    [self presentViewController:popoverCon animated:NO completion:^{
        NSLog(@"gunchulai ");
    }];
//    UIPopoverController
}
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover消失， 默认YES
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
