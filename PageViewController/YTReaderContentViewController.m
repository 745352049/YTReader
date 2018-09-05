//
//  YTReaderContentViewController.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/8/31.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "YTReaderContentViewController.h"

@interface YTReaderContentViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation YTReaderContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:230.0/255.0 blue:174.0/255.0 alpha:1];
    self.view.backgroundColor = self.bgColor;
    self.label.frame = CGRectMake(10, [[UIApplication sharedApplication] statusBarFrame].size.height, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height*4);
    [self.view addSubview:self.label];
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor clearColor];
        _label.textAlignment = NSTextAlignmentLeft;
    }
    return _label;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.label.attributedText = self.content;
    [self.label setLineBreakMode:NSLineBreakByCharWrapping];
    [self.label sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
