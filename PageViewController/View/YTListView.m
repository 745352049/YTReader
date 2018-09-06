//
//  YTListView.m
//  PageViewController
//
//  Created by 水晶岛 on 2018/9/5.
//  Copyright © 2018年 水晶岛. All rights reserved.
//

#import "YTListView.h"

#define UI_StatusBar_Height [[UIApplication sharedApplication] statusBarFrame].size.height
#define UI_SafeArea_Height ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34.0:0.0)
#define UI_NavBar_Height ([[UIApplication sharedApplication] statusBarFrame].size.height>20?88.0:64.0)

@interface YTListView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YTListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView.frame = CGRectMake(0, UI_StatusBar_Height, self.bounds.size.width, self.bounds.size.height-UI_StatusBar_Height);
        [self addSubview:self.tableView];
    }
    return self;
}
- (void)setTableArray:(NSMutableArray *)tableArray {
    _tableArray = tableArray;
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor colorWithRed:245.0/255 green:248.0/255 blue:250.0/255 alpha:1];
        _tableView.separatorColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.tableArray.count) {
        return self.tableArray.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
    }
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"书籍目录";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(ytListView:didSelectRowAtIndexPath:)]) {
        [_delegate ytListView:self didSelectRowAtIndexPath:indexPath];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

@end
