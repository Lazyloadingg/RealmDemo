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
#import "Other.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     注意：在我们查询一个模型后，所获取的数据不是拷贝出来的，而是直接操控数据库
  比如从数据库查询出一个Person实例person，person有一个name属性，当你修改person的name时不需要另外执行更新数据库操作，数据库已经进行了更新，但是你对person的操作必须在事务中执行，且必须和执行查询操作查出person的线程为同一线程
     
     */
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
    NSDictionary * info3 = @{
                             @"master" : @"小六",
                             @"name" : @"pig"
                             };
    
    //坑爹 本来创建了自定义类Dog  run之后一直报错提示已经设置主键  我擦 找了半天原因居然是官方已经创建了Dog类
    Other * dog = [Other mj_objectWithKeyValues:info3];
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:dog];
    }];
    
    Person * person2 = [Person objectForPrimaryKey:@"小红"];
    if (person2) {
        NSLog(@"222222----%@",person2);
    }
}


@end
