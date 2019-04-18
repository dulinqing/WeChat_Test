//
//  PopoverTableViewController.m
//  我的微信
//
//  Created by du-lq on 2018/10/19.
//  Copyright © 2018年 du-lq. All rights reserved.
//

#import "PopoverTableViewController.h"

@interface PopoverTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray *arry;
@end

@implementation PopoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] ;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.rowHeight=40;
    self.tableView.scrollEnabled=NO;
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellPopover"];
    _arry=[NSMutableArray arrayWithObjects:@"发起群聊",@"添加朋友",@"扫一扫",@"收付款", nil];
    
}
- (CGSize)preferredContentSize {
    if (self.presentingViewController && self.tableView != nil) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        tempSize.height=160;
        //返回一个完美适应tableView的大小的 size; sizeThatFits 返回的是最合适的尺寸, 但不会改变控件的大小
        CGSize size = [self.tableView sizeThatFits:tempSize];
        return size;
    }else{
        return [self preferredContentSize];
    }
}

//- (void)setPreferredContentSize:(CGSize)preferredContentSize{
//    super.preferredContentSize=preferredContentSize;
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.arry count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellPopover" forIndexPath:indexPath];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellPopover"];
    }
    cell.textLabel.text=[self.arry objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:@"tab_mine_unselect@3x"];
    cell.backgroundColor=[UIColor grayColor];
    cell.selectionStyle= UITableViewCellSelectionStyleBlue;
    cell.clipsToBounds=YES;
    cell.textLabel.textColor=[UIColor whiteColor];
    // Configure the cell...
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //当离开某行时，让某行的选中状态消失
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
