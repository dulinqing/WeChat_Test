//
//  WeiXin_TableViewController.m
//  我的微信
//
//  Created by du-lq on 2018/9/13.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "WeiXin_TableViewController.h"
#import "loginViewController.h"

@interface WeiXin_TableViewController ()
@property NSMutableArray *sectionName;
@property NSMutableArray *rowNum;
@end

@implementation WeiXin_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.sectionHeaderHeight=15;
    self.tableView.sectionFooterHeight=5;
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,15)];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//    self.tableView.separatorColor=[UIColor redColor];
//    由于视图继承自UITableViewController所以，这里本身就自带tableView，所以这种情况下，self.view 和  self.tableview是相同的。
//    NSLog(@"%@",self.view);
//    NSLog(@"%@",self.tableView);
}
-(instancetype)initWithStyle:(UITableViewStyle)style{
   return  [super initWithStyle:UITableViewStyleGrouped];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    _rowNum = [NSMutableArray arrayWithObjects:@(1),@(1),@(4),@(1), nil];
    return [_rowNum[section] intValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 100;
            break;
            
        default:
            return 50;
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=nil;
     _sectionName=[NSMutableArray array];
    for (int i = 0; i< 4; i++) {
         NSString *str=[NSString stringWithFormat:@"the_%d_Cell",i];
        [_sectionName addObject:str];
    
    }
    if(cell==nil){
        if ([_sectionName[indexPath.section] isEqualToString:@"the_0_Cell"]) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"the_0_Cell"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"username";
            cell.textLabel.textColor=[UIColor blackColor];
            cell.imageView.image=[self changeImageSize:[UIImage imageNamed:@"test.jpg"]];
            
            cell.imageView.contentMode=UIViewContentModeScaleToFill;
            cell.detailTextLabel.text=[NSString stringWithFormat:@"微信号：%@",cell.textLabel.text];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            
        }
        if ([_sectionName[indexPath.section] isEqualToString:@"the_1_Cell"]) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"the_1_Cell"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            for (int i=0; i<[_rowNum[indexPath.section] intValue]; i++) {
                if (indexPath.row==i) {
                    cell.textLabel.text=@"钱包";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MoreMyBankCard@3x"];
                }
            }
            cell.selectionStyle=UITableViewCellSelectionStyleBlue;
            
        }
        if ([_sectionName[indexPath.section] isEqualToString:@"the_2_Cell"]) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"the_2_Cell"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            for (int i=0; i<[_rowNum[indexPath.section] intValue]; i++) {
                if (indexPath.row==0) {
                    cell.textLabel.text=@"收藏";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MoreMyAlbum@3x"];
                }
                if (indexPath.row==1) {
                    cell.textLabel.text=@"相册";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MoreMyFavorites@3x"];
                }
                if (indexPath.row==2) {
                    cell.textLabel.text=@"卡包";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MyCardPackageIcon@2x"];
                }
                if (indexPath.row==3) {
                    cell.textLabel.text=@"表情";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MoreExpressionShops@3x"];
                }
            }
             cell.selectionStyle=UITableViewCellSelectionStyleGray;
        }
        if ([_sectionName[indexPath.section] isEqualToString:@"the_3_Cell"]) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"the_3_Cell"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            for (int i=0; i<[_rowNum[indexPath.section] intValue]; i++) {
                if (indexPath.row==i) {
                    cell.textLabel.text=@"设置";
                    cell.textLabel.textColor=[UIColor blackColor];
                    cell.imageView.image=[UIImage imageNamed:@"MoreSetting@3x"];
                }
                
            }
            
        }
    }
    return cell;
    }
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //当离开某行时，让某行的选中状态消失
    if ([_sectionName[indexPath.section] isEqualToString:@"the_3_Cell"]) {
        loginViewController *loginV=[[loginViewController alloc]init];
        [UIApplication sharedApplication].delegate.window.rootViewController=loginV;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSUserDefaults standardUserDefaults] setObject:@(0) forKey:@"logined"];
}

-(UIImage *)changeImageSize:(UIImage *)image{
    UIGraphicsBeginImageContext(CGSizeMake(50, 50));
    
    [image drawInRect:CGRectMake(0, 0, 50, 50)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
@end

    
