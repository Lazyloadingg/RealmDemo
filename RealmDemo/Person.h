//
//  Person.h
//  RealmDemo
//
//  Created by Apple on 2019/4/20.
//  Copyright © 2019 lazyloading. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN



@interface Person : RLMObject
@property NSString * name;
@property NSInteger age;
@property NSInteger sex;
@end

NS_ASSUME_NONNULL_END
