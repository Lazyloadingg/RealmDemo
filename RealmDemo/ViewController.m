//
//  ViewController.m
//  RealmDemo
//
//  Created by Apple on 2019/4/20.
//  Copyright © 2019 lazyloading. All rights reserved.
//

#import "ViewController.h"
#import <RLMRealm.h>
#import <MJExtension.h>
#import "Person.h"
#import <RLMRealmConfiguration.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //获取默认数据库 也可通过配置RLMRealmConfiguration自定义数据库路径
    RLMRealm * realm = [RLMRealm defaultRealm];
    
    
    NSDictionary * info = @{
                            @"name" : @"小明",
                            @"age" : @23,
                            @"sex" : @1
                            };
    
    NSDictionary * info1 = @{
                            @"name" : @"小红",
                            @"age" : @21,
                            @"sex" : @0
                            };
    Person * person = [Person mj_objectWithKeyValues:info];
    Person * person1 = [Person mj_objectWithKeyValues:info1];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObjects:@[person]];
    }];
    
    [realm transactionWithBlock:^{
        [realm deleteObject:person];
    }];
    
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:person1];
    }];
   Person * result = [Person objectForPrimaryKey:person1.name];
    NSLog(@"%ld",result.age);
    
    [realm transactionWithBlock:^{
        person1.age = @(22).integerValue;
    }];
    
    
    Person * result1 = [Person objectForPrimaryKey:person1.name];
    NSLog(@"%ld",result1.age);
    [realm transactionWithBlock:^{
        
        result1.age = @(25).integerValue;
    }];
      NSLog(@"%ld",person1.age);
}


@end
