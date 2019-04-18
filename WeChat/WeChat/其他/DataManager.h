//
//  DataManager.h
//  WeChat
//
//  Created by du-lq on 2018/11/12.
//  Copyright © 2018 du-lq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject
@property(nonnull,nonatomic,strong) NSString *userName;
@property(nonatomic,nonnull,strong) NSString *password;
@property(nonatomic) NSMutableArray *array;
-(void)saveData:(NSMutableArray *)loginArray;
-(NSMutableArray *)searchData;
@end

NS_ASSUME_NONNULL_END
