//
//  WeiXinTableViewController.m
//  我的微信
//
//  Created by du-lq on 2018/10/18.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "WeiXinTableViewController.h"


@interface WeiXinTableViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UISearchBar *searchBar;
}
@property (nonatomic) NSMutableArray *numOfData;
@end

@implementation WeiXinTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor=[UIColor grayColor];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    UIView *header=self.tableView.tableHeaderView;
    [self addHeaderOfSearch:header];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"haoyouCell"];
//    self.tableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
//    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    self.tableView.bounces=YES;
}
-(void)addHeaderOfSearch:(UIView *)headerView{
    searchBar=[[UISearchBar alloc]initWithFrame:headerView.frame];
    searchBar.barStyle=UISearchBarStyleDefault;
    searchBar.barTintColor=[UIColor purpleColor];
    searchBar.searchBarStyle=UISearchBarStyleProminent;
    searchBar.placeholder=@"搜索";
    searchBar.delegate=self;
    searchBar.returnKeyType=UIReturnKeySearch;
    [searchBar setPositionAdjustment:UIOffsetMake(searchBar.frame.size.width/2-50, 0) forSearchBarIcon:UISearchBarIconSearch];
    [headerView addSubview:searchBar];
//    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTableViewTouchInSide)];
//
//    tableViewGesture.numberOfTapsRequired = 1;
//
//    tableViewGesture.cancelsTouchesInView = NO;
//
//    [self.tableView addGestureRecognizer:tableViewGesture];
//

}
-(void)commentTableViewTouchInSide{
    [searchBar endEditing:YES];
}
#pragma mark - Table view data source
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
- (void)searchBarTextEndEditing:(UISearchBar *)searchBar;{
    NSLog(@"结束编辑");
    [searchBar resignFirstResponder];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;{
    NSLog(@"已经结束编辑");
    [searchBar resignFirstResponder];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.numOfData=[NSMutableArray array];
    for (int i=0; i<25; i++) {
        NSString *str=[NSString stringWithFormat:@"the_%d_Cell",i];
        [_numOfData addObject:str];
    }
    return [_numOfData count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"haoyouCell" forIndexPath:indexPath];
    
    UITableViewCell *cell;
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"haoyouCell"];
    }
    cell.textLabel.text=[self.numOfData objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=@"杜杜：你好";
    
    cell.imageView.image=[self changeImageSize:[UIImage imageNamed:@"test.jpg"]];
    
    cell.imageView.contentMode=UIViewContentModeScaleToFill;
    cell.imageView.layer.cornerRadius=10;
    
    cell.imageView.clipsToBounds=YES;
    return cell;
}
-(UIImage *)changeImageSize:(UIImage *)image{
    UIGraphicsBeginImageContext(CGSizeMake(50, 50));
    
    [image drawInRect:CGRectMake(0, 0, 50, 50)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //当离开某行时，让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
