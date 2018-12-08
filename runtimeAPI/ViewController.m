//
//  ViewController.m
//  runtimeAPI
//
//  Created by Mae on 2018/12/5.
//  Copyright © 2018年 刘静冉. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Father.h"
#import "Son.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Father *dad = [Father new];
    dad.name = @"支付宝";
    Son *son = [Son new];
    son.girlFriend = @"支儿子";
    
  
    //获取类对象
    NSLog(@"%@ %@",object_getClass([dad class]),object_getClass(son));
    //将dad的类强制改为Son类型
//    object_setClass(dad, [NSObject class]);
    //是否是类对象
     NSLog(@"%d %d %d",object_isClass([son class]),object_isClass(dad),object_isClass(object_getClass([son class])));
    //获取类名
    NSLog(@"%s %s",class_getName([dad class]),class_getName([son class]));
    //获取类的父类
    NSLog(@"获取父类%@ %@",class_getSuperclass([dad class]),class_getSuperclass([son class]));
    // 获取实例大小
    NSLog(@"%zu %zu",class_getInstanceSize([dad class]),class_getInstanceSize([son class]));
    
    
    /**********************为什么都是NULL**************************/
    //类中指定名称实例成员变量的信息
    Ivar nameIVar = class_getInstanceVariable([Father class], "_name");
    NSLog(@"例成员变量的信息%s %s",ivar_getName(nameIVar),ivar_getTypeEncoding(nameIVar));
   
    //获取实例方法
    Method method1 = class_getInstanceMethod([son class], @selector(sonSelector));
    NSLog(@"/获取实例方法%s",method_getTypeEncoding(method1));
    
    
    
    //动态创建一个类
    Class newClass = objc_allocateClassPair([NSObject class], "Mather", 0);
    //给类添加成员变量
    class_addIvar([newClass class], "a", 4, 1, @encode(int));
    //添加方法
    Method method = class_getInstanceMethod([self class], @selector(test));
    class_addMethod([newClass class], @selector(test), method_getImplementation(method), method_getTypeEncoding(method));
    //注册类
    objc_registerClassPair([newClass class]);
    //创建新类的实例对象
    id newClass1 = [[newClass alloc]init];
    // 给实例对象的成员变量赋值
    [newClass1 setValue:@10 forKey:@"a"];
    NSLog(@"%@",[newClass1 valueForKey:@"a"]);//取值
    [newClass1 test];//调用方法
    
    //copy对象,利用iVarList重写IvarList 
    Son *sonyoung = [son mutableCopy];
    NSLog(@"%@",sonyoung.girlFriend);
}
- (void)test{
    NSLog(@"test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
