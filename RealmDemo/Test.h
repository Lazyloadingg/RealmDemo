//
//  Test.h
//  RealmDemo
//
//  Created by Apple on 2019/4/22.
//Copyright © 2019 lazyloading. All rights reserved.
//

#import <Realm/Realm.h>

@interface Test : RLMObject

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Test *><Test>
RLM_ARRAY_TYPE(Test)
