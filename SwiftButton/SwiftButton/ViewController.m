//
//  ViewController.m
//  SwiftButton
//
//  Created by xyqm on 16/10/13.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

#import "ViewController.h"
#import "SwiftButton-swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 300, 100, 100);
    button1.backgroundColor = [UIColor yellowColor];
    [button1 addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}

- (void)aaa{
    NewViewController *new = [[NewViewController alloc]init];
    [self.navigationController pushViewController:new animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
