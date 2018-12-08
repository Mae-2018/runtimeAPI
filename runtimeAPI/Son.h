//
//  Son.h
//  runtimeAPI
//
//  Created by Mae on 2018/12/7.
//  Copyright © 2018年 刘静冉. All rights reserved.
//

#import "Father.h"

@interface Son : Father<NSMutableCopying>
@property (nonatomic ,copy) NSString *school;
@property (nonatomic ,strong) NSMutableArray *classMates;
@property (nonatomic ,strong) NSMutableArray *tools;
@property (nonatomic ,strong) NSString *girlFriend;
@property (nonatomic ,copy) NSString *car;
- (void)sonSelector;
@end
