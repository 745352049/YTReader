//
//  ViewController.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/8/31.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "ViewController.h"

#import "YTReaderViewController.h"
#import "NSAttributedString+YTReaderPage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Page";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *readBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [readBtn setTitle:@"开始阅读" forState:UIControlStateNormal];
    [readBtn setTintColor:[UIColor whiteColor]];
    [readBtn setBackgroundColor:[UIColor redColor]];
    readBtn.frame = CGRectMake(100, 200, [UIScreen mainScreen].bounds.size.width-200, 44);
    [readBtn addTarget:self action:@selector(readAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readBtn];
}
- (void)readAction {
    YTReaderViewController *vc = [[YTReaderViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
