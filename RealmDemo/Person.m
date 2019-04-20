//
//  Person.m
//  RealmDemo
//
//  Created by Apple on 2019/4/20.
//  Copyright © 2019 lazyloading. All rights reserved.
//

#import "Person.h"

@implementation Person
+(NSString *)primaryKey{
    return @"name";
}
+ (NSArray<NSString *> *)indexedProperties{
    return @[@"name"];
}
@end
