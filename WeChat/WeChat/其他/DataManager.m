//
//  DataManager.m
//  WeChat
//
//  Created by du-lq on 2018/11/12.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

-(BOOL)isFileExist:(NSString *)path{
    NSFileManager *manager=[NSFileManager defaultManager];
    return [manager fileExistsAtPath:path];
}
- (void)saveData:(NSMutableArray *)loginArray{
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"documentPath=%@",path);
    NSString *filePath=[path stringByAppendingPathComponent:@"loginData.plist"];
    NSLog(@"__________%@",filePath);
    
        [loginArray writeToFile:filePath atomically:YES];
    

}
- (NSMutableArray *)searchData{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath=[path stringByAppendingPathComponent:@"loginData.plist"];
    if([self isFileExist:filePath]){
        array=[NSMutableArray arrayWithContentsOfFile:filePath];
    }
    return array;
}
@end
