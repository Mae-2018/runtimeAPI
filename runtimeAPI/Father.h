//
//  Father.h
//  runtimeAPI
//
//  Created by Mae on 2018/12/6.
//  Copyright © 2018年 刘静冉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Father : NSObject
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *gender;
@property (nonatomic ,assign) NSInteger age;
@property (nonatomic ,assign) NSInteger height;
@property (nonatomic ,copy) NSString *wife;
@property (nonatomic ,copy) NSString *son;
@property (nonatomic ,strong) NSMutableArray *friends;
- (void)fatherSelector;
@end
